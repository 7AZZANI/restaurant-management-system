from django.utils.timezone import datetime 
from django.shortcuts import render

from management.models import Category, FoodItem, Order


def home(request):
    categories = Category.objects.all().order_by("rank")
    return render(request, "home.html", {"categories": categories })


def compact_menu(request):
    total_category = Category.objects.all().count()  # count all categories so that can be divided into 2 columns
    col_one_categories = Category.objects.all().order_by("rank")[: round(total_category / 2) + 1]
    col_two_categories = Category.objects.all().order_by("rank")[round(total_category / 2) + 1 :]

    return render(
        request,
        "compact-menu.html",
        {"col_one_categories": col_one_categories, "col_two_categories": col_two_categories},
    )


def food_items(request, slug):
    category = Category.objects.get(slug=slug)
    food_items = FoodItem.objects.filter(category__slug=slug).order_by("name")
    return render(request, "food-items.html", {"food_items": food_items, "category": category})


def check_order(request, order_no=None, table_no=None):
    try:
        order = Order.objects.get(order_no=int(order_no),table_no=int(table_no), date__date=datetime.date(datetime.today()))
    except Exception as e:
        order = None
        print(e)
    return render(request, "check-order.html", {"order": order})
