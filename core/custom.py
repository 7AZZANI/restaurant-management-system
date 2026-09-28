from django.contrib.admin.options import ModelAdmin
from django.contrib.admin.decorators import display
from django.utils.safestring import mark_safe

class CustomModelAdmin(ModelAdmin):

    @display(description=mark_safe('<input type="checkbox" id="action-toggle" class="checkbox checkbox-xs">'))
    def action_checkbox(self, obj):
        return super().action_checkbox(obj)

