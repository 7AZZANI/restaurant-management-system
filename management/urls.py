from django.urls import path
from management import views

urlpatterns = [
    path("order/", views.order, name="order"),
    path("order/action/", views.order_action, name="order_action"),
] 