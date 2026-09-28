from django.contrib import admin
from core.custom import CustomModelAdmin
from rangefilter.filters import DateRangeFilter

from management.models import Category, FoodItem, FoodItemIngredient, Ingredient, Order, OrderItem, QuantityUnit
from management.utils import change_ingredients_quantity, update_orders

@admin.register(FoodItem)
class FoodItemAdmin(CustomModelAdmin):
    list_display = ["name", "price", "category_name", "quantity_available", "ingredient_list"]
    list_per_page = 20

    def category_name(self, obj):
        return obj.category.name

    def ingredient_list(self, obj):
        return ", ".join(["{} ({} {})".format(obj.ingredient.name, obj.quantity, obj.unit.name) for obj in obj.ingredients.all()]) if obj.ingredients.all() else "-"

    category_name.short_description = "category"

@admin.register(Category)
class CategoryAdmin(CustomModelAdmin):
    list_display = ["name", "rank", "created_at"]

@admin.register(Order)
class OrderAdmin(CustomModelAdmin):
    list_display = ["order_no", "table_no",  "status",  "date", "total_price", "food_items"]
    list_filter = [("date", DateRangeFilter), "status"]
    actions = ["mark_as_completed", "mark_as_cancelled"]

    def mark_as_completed(self, request, queryset):
        queryset.update(status="Completed")
        update_orders()
    
    def mark_as_cancelled(self, request, queryset):
        for order in queryset:
            order_items = order.food_items
            if order.status != "Cancelled":
                order_cancelled_updation(order_items)
        queryset.update(status="Cancelled")
        update_orders()

    def food_items(self, obj):
        return "\n".join([f"{item.food_item.name} ({item.quantity})" for item in obj.food_items.all()])

    def save_model(self, request, obj, form, change):
        if 'status' in form.changed_data and form.initial["status"] != "Cancelled" and obj.status == "Cancelled":
            order_items = obj.food_items
            order_cancelled_updation(order_items)
            
        return super().save_model(request, obj, form, change)
    
def order_cancelled_updation(order_items):
    for order_item in order_items:
        food_item = order_item.food_item
        food_item.quantity_available += order_item.quantity
        food_item.save()
        food_item_ingredients = food_item.ingredients.all()
        change_ingredients_quantity(order_item, food_item_ingredients, "add")

@admin.register(OrderItem)
class OrderItemAdmin(CustomModelAdmin):
    list_display = ["order", "date", "food_item", "quantity", "price", "total_price"]
    list_filter = ["order"]

    def price(self, obj):
        return obj.food_item.price

    def date(self, obj):
        return obj.order.date

@admin.register(Ingredient)
class IngredientAdmin(CustomModelAdmin):
    list_display = ["name", "type", "quantity_available_rounded", "unit", "limit", "created_at"]

    def quantity_available_rounded(self, obj):
        return round(obj.quantity_available, 2)

@admin.register(QuantityUnit)
class QuantityUnitAdmin(CustomModelAdmin):
    list_display = ["name", "created_at"]

@admin.register(FoodItemIngredient)
class FoodItemIngredientAdmin(CustomModelAdmin):
    list_display = ["food_item","ingredient", "quantity_rounded", "unit"]

    def quantity_rounded(self, obj):
        return round(obj.quantity, 2)

    def food_item(self, obj):
        food_item = FoodItem.objects.filter(ingredients=obj)
        return ", ".join([item.name for item in food_item])