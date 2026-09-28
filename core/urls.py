"""core URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/4.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import include, path, re_path
from django.conf.urls.static import static

from .settings import MEDIA_URL, MEDIA_ROOT
from . import views

admin.site.site_header = "Restaurant Menu Admin | By 7AZZANI.COM"
admin.site.site_title = "Restaurant Menu Admin Portal"
admin.site.index_title = "Restaurant Menu Control Center — Built by 7AZZANI.COM"

urlpatterns = [
    path("admin/", admin.site.urls, {"extra_context": {"webpush": {"group": "admin"}}}),
    path("", views.home, name="home"),
    path("compact-menu/", views.compact_menu, name="compact-menu"),
    path("check-order/", views.check_order, name="check-order"),
    path("check-order/<str:order_no>/<str:table_no>/", views.check_order, name="check-order"),
    path("food-items/<slug:slug>/", views.food_items, name="food-items"),
    path("", include("management.urls")),
    re_path(r"^webpush/", include("webpush.urls")),
] + static(MEDIA_URL, document_root=MEDIA_ROOT)
