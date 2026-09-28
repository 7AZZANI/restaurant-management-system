
from django.http import JsonResponse
from management.models import FoodItem, Order, OrderItem

import json

def order(request):
    if request.method == "POST":
        data = json.loads(request.POST["data"])
        try:
            order = Order.objects.create(order_no=int(data["order_no"]), table_no=int(data["table_no"]), total_price=float(data["total_price"]))
            for food_item in data["food_items"]:
                item_obj = FoodItem.objects.get(slug=food_item["slug"])
                item_obj.quantity_available -= int(food_item["quantity"])
                item_obj.save()
                OrderItem.objects.create(order=order, food_item=item_obj, quantity=int(food_item["quantity"]), total_price=float(food_item["price"]))
            return JsonResponse({"success": 1}, status=200)
        except Exception as e:
            print("-->", e)
            return JsonResponse({"success": 0}, status=400)

def order_action(request):
    if request.method == "POST":
        data = json.loads(request.POST["data"])
        try:
            for order_id in data["orders"]:
                order = Order.objects.get(id=order_id)
                order.status = data["action"]
                order.save()
            return JsonResponse({"success": 1}, status=200)
        except Exception as e:
            print("-->", e)
            return JsonResponse({"success": 0}, status=400)

        
