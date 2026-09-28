from django.utils.timezone import datetime
from core.utils import calculate_meat, fetch_inventory_items, fetch_sales_chart_data
from management.models import Ingredient, Order
from django.db.models import Sum, F

def dashboard_context(request):
    if request.path == "/admin/":
        # order and sales data
        pending_orders_today = Order.objects.filter(status="Pending", date__date=datetime.date(datetime.today()))
        pending_orders = Order.objects.filter(status="Pending").order_by('-date')
        completed_orders = Order.objects.filter(status="Completed")
        sales_total = Order.objects.filter(status="Completed").aggregate(Sum("total_price"))["total_price__sum"]
        sales_today = Order.objects.filter(status="Completed", date__date=datetime.date(datetime.today())).aggregate(
            Sum("total_price")
        )["total_price__sum"]

        # meat data
        total_meat = calculate_meat()

        # inventory data for chart
        inventory_chart = fetch_inventory_items()

        #sales data for chart
        sales_chart = fetch_sales_chart_data()

        # low ingredients
        low_ingredients = Ingredient.objects.filter(quantity_available__lte=F("limit"))

        return {
            "pending_orders_count": pending_orders_today.count(),
            "completed_orders_count": completed_orders.count(),
            "sales_total": sales_total,
            "sales_today": sales_today if sales_today else 0,
            "total_meat": total_meat,
            "inventory_chart": inventory_chart,
            "sales_chart": sales_chart,
            "pending_orders": pending_orders[:10],
            "low_ingredients": low_ingredients,
        }
    return {}
