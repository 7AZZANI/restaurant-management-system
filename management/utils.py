from django.utils.timezone import datetime
from django.db.models import Sum
from channels.layers import get_channel_layer
from asgiref.sync import async_to_sync
from core.utils import fetch_sales_chart_data

import json
import management.models


def change_ingredients_quantity(order_item, food_item_ingredients, operation):
    if operation == "substract":
        for item in food_item_ingredients:
            ingredient = item.ingredient
            if item.unit.name == ingredient.unit.name:
                ingredient.quantity_available -= (item.quantity * order_item.quantity)
            else:
                if item.unit.name == "Gram" and ingredient.unit.name == "Kilogram":
                    ingredient.quantity_available -= (item.quantity * order_item.quantity) / 1000
                elif item.unit.name == "Kilogram" and ingredient.unit.name == "Gram":
                    ingredient.quantity_available -= (item.quantity * order_item.quantity) * 1000
                elif item.unit.name == "Milliliter" and ingredient.unit.name == "Liter":
                    ingredient.quantity_available -= (item.quantity * order_item.quantity) / 1000
                elif item.unit.name == "Liter" and ingredient.unit.name == "Milliliter":
                    ingredient.quantity_available -= (item.quantity * order_item.quantity) * 1000
            ingredient.save()
    elif operation == "add":
        for item in food_item_ingredients:
            ingredient = item.ingredient
            if item.unit.name == ingredient.unit.name:
                ingredient.quantity_available += (item.quantity * order_item.quantity)
            else:
                if item.unit.name == "Gram" and ingredient.unit.name == "Kilogram":
                    ingredient.quantity_available += (item.quantity * order_item.quantity) / 1000
                elif item.unit.name == "Kilogram" and ingredient.unit.name == "Gram":
                    ingredient.quantity_available += (item.quantity * order_item.quantity) * 1000
                elif item.unit.name == "Milliliter" and ingredient.unit.name == "Liter":
                    ingredient.quantity_available += (item.quantity * order_item.quantity) / 1000
                elif item.unit.name == "Liter" and ingredient.unit.name == "Milliliter":
                    ingredient.quantity_available += (item.quantity * order_item.quantity) * 1000
            ingredient.save()

def update_orders():
    channel_layer = get_channel_layer()

    pending_orders_today = management.models.Order.objects.filter(status="Pending", date__date=datetime.date(datetime.today()))
    pending_orders = management.models.Order.objects.filter(status="Pending").order_by('-date')
    pending_orders_json = []
    for order in pending_orders:
        pending_orders_json.append({
            "id": order.id,
            "order_no": order.order_no,
            "table_no": order.table_no,
            "total_price": order.total_price,
            "date": order.date.strftime("%B %d, %Y, %I:%M %p"),
            "food_items": "\n".join([f"{item.food_item.name} ({item.quantity})" for item in order.food_items.all()])
        })
    completed_orders = management.models.Order.objects.filter(status="Completed")
    sales_total = management.models.Order.objects.filter(status="Completed").aggregate(Sum("total_price"))["total_price__sum"]
    sales_today = management.models.Order.objects.filter(status="Completed", date__date=datetime.date(datetime.today())).aggregate(
        Sum("total_price")
    )["total_price__sum"]
    sales_chart = fetch_sales_chart_data()

    async_to_sync(channel_layer.group_send)(
        "admin",
        {
            "type": "update_dashboard",
            "payload": json.dumps({
                "type": "check_orders",
                "pending_orders_today": pending_orders_today.count(),
                "pending_orders": pending_orders_json,
                "completed_orders": completed_orders.count(),
                "sales_total": sales_total,
                "sales_today": sales_today if sales_today else 0,
                "sales_chart": sales_chart,
            }),
        }
    )
