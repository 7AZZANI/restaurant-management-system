import os
import sys
import django
from datetime import datetime

os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'core.settings')
django.setup()

from account.models import User
from management.models import (
    Category, FoodItem, FoodItemIngredient, Ingredient,
    Order, OrderItem, QuantityUnit
)

def parse_dump(filename):
    with open(filename, 'r', encoding='utf-8', errors='ignore') as f:
        lines = f.readlines()

    current_table = None
    columns = []
    tables_data = {}

    for line in lines:
        line_clean = line.strip('\r\n')
        if line_clean.startswith('COPY public.'):
            # COPY public.table_name (col1, col2) FROM stdin;
            parts = line_clean.split('FROM stdin;')[0].strip()
            table_part = parts.split('(')[0].replace('COPY public.', '').strip()
            cols_part = parts.split('(')[1].rstrip(')').strip()
            current_table = table_part
            columns = [c.strip().strip('"') for c in cols_part.split(',')]
            tables_data[current_table] = {'columns': columns, 'rows': []}
        elif current_table and line_clean == r'\.':
            current_table = None
            columns = []
        elif current_table:
            # tab-separated values
            vals = line.rstrip('\r\n').split('\t')
            row = {}
            for col, val in zip(tables_data[current_table]['columns'], vals):
                row[col] = None if val == r'\N' else val
            tables_data[current_table]['rows'].append(row)

    return tables_data

def load_data():
    data = parse_dump('rms_dump.sql')
    print("Found tables:", list(data.keys()))

    # 1. QuantityUnit
    if 'management_quantityunit' in data:
        for r in data['management_quantityunit']['rows']:
            QuantityUnit.objects.update_or_create(
                id=int(r['id']),
                defaults={
                    'name': r['name'],
                }
            )
        print(f"Loaded {len(data['management_quantityunit']['rows'])} QuantityUnits")

    # 2. Category
    if 'management_category' in data:
        for r in data['management_category']['rows']:
            Category.objects.update_or_create(
                id=int(r['id']),
                defaults={
                    'name': r['name'],
                    'slug': r['slug'],
                    'image': r['image'] if r['image'] else '',
                    'rank': int(r['rank']) if r['rank'] else 0,
                    'description': r['description'],
                }
            )
        print(f"Loaded {len(data['management_category']['rows'])} Categories")

    # 3. Ingredient
    if 'management_ingredient' in data:
        for r in data['management_ingredient']['rows']:
            Ingredient.objects.update_or_create(
                id=int(r['id']),
                defaults={
                    'name': r['name'],
                    'slug': r['slug'],
                    'quantity_available': float(r['quantity_available']) if r['quantity_available'] else 0,
                    'unit_id': int(r['unit_id']),
                    'type': r['type'] if r['type'] else 'Veg',
                    'limit': float(r['limit']) if r.get('limit') else 0,
                }
            )
        print(f"Loaded {len(data['management_ingredient']['rows'])} Ingredients")

    # 4. FoodItemIngredient
    if 'management_fooditemingredient' in data:
        for r in data['management_fooditemingredient']['rows']:
            FoodItemIngredient.objects.update_or_create(
                id=int(r['id']),
                defaults={
                    'quantity': float(r['quantity']),
                    'ingredient_id': int(r['ingredient_id']),
                    'unit_id': int(r['unit_id']),
                }
            )
        print(f"Loaded {len(data['management_fooditemingredient']['rows'])} FoodItemIngredients")

    # 5. FoodItem
    if 'management_fooditem' in data:
        for r in data['management_fooditem']['rows']:
            FoodItem.objects.update_or_create(
                id=int(r['id']),
                defaults={
                    'name': r['name'],
                    'slug': r['slug'],
                    'price': float(r['price']),
                    'image': r['image'] if r['image'] else '',
                    'category_id': int(r['category_id']),
                    'quantity_available': int(r['quantity_available']) if r['quantity_available'] else 0,
                }
            )
        print(f"Loaded {len(data['management_fooditem']['rows'])} FoodItems")

    # 6. FoodItem - FoodItemIngredient M2M
    if 'management_fooditem_ingredients' in data:
        for r in data['management_fooditem_ingredients']['rows']:
            try:
                food = FoodItem.objects.get(id=int(r['fooditem_id']))
                f_ing = FoodItemIngredient.objects.get(id=int(r['fooditemingredient_id']))
                food.ingredients.add(f_ing)
            except Exception as e:
                pass
        print(f"Linked FoodItem Ingredients M2M")

    # 7. Users
    if 'account_user' in data:
        for r in data['account_user']['rows']:
            u, created = User.objects.update_or_create(
                id=int(r['id']),
                defaults={
                    'email': r['email'],
                    'name': r['name'],
                    'is_superuser': r['is_superuser'] == 't',
                    'is_staff': r['is_staff'] == 't',
                    'is_active': r['is_active'] == 't',
                    'password': r['password'],
                }
            )
        print(f"Loaded {len(data['account_user']['rows'])} Users")

    # Also create a default test admin with password 'admin123' if needed
    if not User.objects.filter(email='admin@rms.com').exists():
        admin_user = User.objects.create_superuser('admin@rms.com', 'admin123', name='Admin')
        print("Created superuser admin@rms.com / admin123")
    else:
        # Reset password for admin@rms.com to 'admin123' so user can log in to /admin/
        admin_user = User.objects.get(email='admin@rms.com')
        admin_user.set_password('admin123')
        admin_user.save()
        print("Set admin@rms.com password to 'admin123'")

if __name__ == '__main__':
    load_data()
