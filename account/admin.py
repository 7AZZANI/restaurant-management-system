from django.contrib import admin

from core.custom import CustomModelAdmin

from account.models import User

@admin.register(User)
class UserAdmin(CustomModelAdmin):
    list_display = ["email", "name", "is_superuser"]
    list_display_links = ["email", "name"]