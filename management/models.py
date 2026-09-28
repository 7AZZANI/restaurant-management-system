from django.db import models
from django.dispatch import receiver
from django.db.models.signals import pre_delete, post_save
from django.template.defaultfilters import slugify
from django.core.validators import MaxValueValidator, MinValueValidator 
from webpush import send_group_notification
from channels.layers import get_channel_layer
from asgiref.sync import async_to_sync
from core.utils import calculate_meat, fetch_inventory_items
from management.utils import change_ingredients_quantity, update_orders

import os
import json

# food model ----------------------------------------

def food_image_path(instance, filename):
    extension = filename.split(".")[-1]
    filename = slugify(instance.name) + "." + extension
    return os.path.join("food-items/{}/".format(instance.category.slug), filename)

class FoodItem(models.Model):
    name = models.CharField(max_length=100, unique=True)
    slug = models.SlugField(max_length=100, blank=True, help_text="Slug will be generated automatically from the name of the food item")
    price = models.FloatField()
    image = models.ImageField(upload_to=food_image_path)
    category = models.ForeignKey('Category', on_delete=models.CASCADE)
    created_at = models.DateTimeField(auto_now_add=True)
    quantity_available = models.IntegerField(default=0)
    ingredients = models.ManyToManyField('FoodItemIngredient', blank=True)

    def __str__(self):
        return self.name

    def save(self, *args, **kwargs):
        self.slug = slugify(self.name)
        super(FoodItem, self).save(*args, **kwargs)

@receiver(pre_delete, sender=FoodItem)
def food_item_image_delete(sender, instance, **kwargs):
    instance.image.delete(False)

# category model ----------------------------------------

def category_image_path(instance, filename):
    extension = filename.split(".")[-1]
    filename = slugify(instance.name) + "." + extension
    return os.path.join("food-categories/", filename)

class Category(models.Model):
    name = models.CharField(max_length=100, unique=True)
    image = models.ImageField(upload_to=category_image_path, null=True, blank=True)
    description = models.TextField(max_length=100, null=True, blank=True)
    rank = models.PositiveIntegerField(default=0)
    slug = models.SlugField(max_length=100, blank=True, help_text="Slug will be generated automatically from the name of the category")
    created_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.name

    def save(self, *args, **kwargs):
        self.slug = slugify(self.name)
        super(Category, self).save(*args, **kwargs)

    class Meta:
        verbose_name_plural = "categories"

@receiver(pre_delete, sender=FoodItem)
def category_image_delete(sender, instance, **kwargs):
    instance.image.delete(False)


# order model ----------------------------------------
class Order(models.Model):
    order_no = models.PositiveIntegerField()
    date = models.DateTimeField(auto_now_add=True)
    table_no = models.PositiveIntegerField(validators=[MinValueValidator(1), MaxValueValidator(10)])
    total_price = models.FloatField()
    status = models.CharField(max_length=10, choices=(("Pending", "Pending"), ("Completed", "Completed"), ("Cancelled", "Cancelled")), default="Pending")

    @property
    def food_items(self):
        return self.orderitem_set.all()

    def __str__(self):
        return "Order #{}".format(self.order_no)

@receiver(post_save, sender=Order)
def order_operations(sender, instance, created, **kwargs):
    if created:
        payload = {
            "head": "New Order #{} Placed! Table #{}".format(instance.order_no, instance.table_no),
            "body": "See the order details in the orders page of admin panel",
        }
        try:
            send_group_notification(group_name="admin", payload=payload, ttl=900)
        except Exception as e:
            print("Webpush notification skipped:", e)

    try:
        update_orders()
    except Exception as e:
        print("update_orders error:", e)
    


    
class OrderItem(models.Model):
    order = models.ForeignKey('Order', on_delete=models.CASCADE)
    food_item = models.ForeignKey('FoodItem', on_delete=models.CASCADE)
    quantity = models.PositiveIntegerField()
    total_price = models.FloatField()

@receiver(post_save, sender=OrderItem)
def order_item_operations(sender, instance, created, **kwargs):
    if created:
        food_item_ingredients = instance.food_item.ingredients.all()
        change_ingredients_quantity(instance, food_item_ingredients, "substract")
            
# food-item-ingredient model ----------------------------------------
# this is for food item. ex. cheese omelette require 2 omelette and 1 cheese
class FoodItemIngredient(models.Model):
    ingredient = models.ForeignKey('Ingredient', on_delete=models.CASCADE, help_text="Ingredient required for this food item. (if ingredient you are looking for is not available you can add it by clicking on '+' icon.")
    quantity = models.FloatField(help_text="Quantity required of the ingredient for this food item")
    unit = models.ForeignKey('QuantityUnit', on_delete=models.CASCADE)
    created_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return "{} ({} {})".format(self.ingredient.name, self.quantity, self.unit.name)

    class Meta:
        verbose_name_plural = "Food items ingredients"

# ingredient model ----------------------------------------
# this is for how much ingredient quantity available. ex. 1 kg of meat
class Ingredient(models.Model):
    name = models.CharField(max_length=100, unique=True, help_text="Name of the ingredient you want to add to inventory")
    slug = models.SlugField(max_length=100, blank=True, help_text="Slug will be generated automatically from the name of the ingredient")
    quantity_available = models.FloatField(default=0, help_text="Quantity of the ingredient available in the inventory")
    unit = models.ForeignKey('QuantityUnit', on_delete=models.CASCADE)
    created_at = models.DateTimeField(auto_now_add=True)
    type = models.CharField(max_length=10, choices=(("Veg", "Veg"), ("Non-Veg", "Non-Veg")), default="Veg")
    limit = models.FloatField(default=0, help_text="Please specify the limit in the same unit as the quantity available. This limit is to alert the admin if the ingredient is running low.")
    
    def __str__(self):
        return self.name

    def save(self, *args, **kwargs):
        self.slug = slugify(self.name)
        super(Ingredient, self).save(*args, **kwargs)

    class Meta:
        verbose_name_plural = "Ingredients Available"

@receiver(post_save, sender=Ingredient)
def check_ingredients(sender, instance, created, **kwargs):
    channel_layer = get_channel_layer()
    ingredients = Ingredient.objects.all()
    low_ingredients = []
    for ingredient in ingredients:
        if ingredient.quantity_available <= ingredient.limit:
            low_ingredients.append(ingredient.name)

    total_meat = calculate_meat()
    inventory_chart = fetch_inventory_items()

    async_to_sync(channel_layer.group_send)(
        "admin",
        {
            "type": "update_dashboard",
            "payload": json.dumps({
                "type": "check_ingredients",
                "low_ingredients": low_ingredients,
                "total_meat": total_meat,
                "inventory_chart": inventory_chart,
            }),
        }
    )


class QuantityUnit(models.Model):
    name = models.CharField(max_length=100, unique=True)
    created_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.name
    
    class Meta:
        verbose_name_plural = "Ingredients Quantity Unit"