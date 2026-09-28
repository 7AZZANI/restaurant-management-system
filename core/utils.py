from django.utils.timezone import datetime, timedelta
from django.db.models import Sum

import management.models


def is_date_in_current_week(date):
    return date.date() >= datetime.date(datetime.today()) - timedelta(days=7)


def is_date_in_current_month(date):
    return date.date() >= datetime.date(datetime.today()) - timedelta(days=30)


def is_date_in_current_year(date):
    return date.date() >= datetime.date(datetime.today()) - timedelta(days=365)


def calculate_meat():
    meat_by_kilo = management.models.Ingredient.objects.filter(type="Non-Veg", unit__name="Kilogram").aggregate(
        Sum("quantity_available")
    )["quantity_available__sum"]
    meat_by_gram = management.models.Ingredient.objects.filter(type="Non-Veg", unit__name="Gram").aggregate(Sum("quantity_available"))[
        "quantity_available__sum"
    ]
    total_meat = 0 if meat_by_kilo is None else str(meat_by_kilo) + " Kg"

    if meat_by_gram:
        total_meat = "{} Kg".format(meat_by_kilo + (meat_by_gram / 1000))
    return total_meat


def fetch_inventory_items():  # only Kilogram and Gram
    units = management.models.QuantityUnit.objects.filter(name__in=["Kilogram", "Gram"]).values("name")
    ingredients = management.models.Ingredient.objects.filter(unit__name__in=units)
    inventory_chart = []
    for item in ingredients:
        quantity = item.quantity_available
        if item.unit.name == "Gram":
            quantity = quantity / 1000
        inventory_chart.append({"name": item.name, "quantity": quantity})
    return inventory_chart

def fetch_sales_chart_data():
    sales = management.models.Order.objects.filter(status="Completed")
    sales_chart = {
        "data_by_week": [],
        "data_by_month": [],
        "data_by_year": [],
    }
    for item in sales:
        if is_date_in_current_week(item.date):
            sales_chart["data_by_week"].append({
                "date": item.date.strftime("%Y-%m-%d"),
                "value": item.total_price
            })
        if is_date_in_current_month(item.date):
            sales_chart["data_by_month"].append({
                "date": item.date.strftime("%Y-%m-%d"),
                "value": item.total_price
            })
        if is_date_in_current_year(item.date):
            sales_chart["data_by_year"].append({
                "date": item.date.strftime("%Y-%m-%d"),
                "value": item.total_price
            })
    return sales_chart
