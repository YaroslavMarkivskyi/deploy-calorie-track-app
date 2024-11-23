# management/commands/add_food_data.py
from django.core.management.base import BaseCommand
from myapp.models import Food

class Command(BaseCommand):
    help = 'Add 10 rows of food calorie data to the database'

    def handle(self, *args, **kwargs):
        food_data = [
            {'name': 'Apple', 'carbs': 13.8, 'protein': 0.3, 'fats': 0.2, 'calories': 52},
            {'name': 'Banana', 'carbs': 22.8, 'protein': 1.3, 'fats': 0.3, 'calories': 89},
            {'name': 'Orange', 'carbs': 11.8, 'protein': 0.9, 'fats': 0.1, 'calories': 47},
            {'name': 'Broccoli', 'carbs': 6.6, 'protein': 2.8, 'fats': 0.4, 'calories': 55},
            {'name': 'Almonds', 'carbs': 21.6, 'protein': 21.2, 'fats': 49.9, 'calories': 579},
            {'name': 'Chicken Breast', 'carbs': 0.0, 'protein': 31.0, 'fats': 3.6, 'calories': 165},
            {'name': 'Rice', 'carbs': 28.0, 'protein': 2.7, 'fats': 0.3, 'calories': 130},
            {'name': 'Avocado', 'carbs': 8.5, 'protein': 2.0, 'fats': 15.0, 'calories': 160},
            {'name': 'Salmon', 'carbs': 0.0, 'protein': 20.0, 'fats': 13.0, 'calories': 208},
            {'name': 'Egg', 'carbs': 1.1, 'protein': 12.6, 'fats': 10.6, 'calories': 155},
        ]

        for food in food_data:
            Food.objects.create(
                name=food['name'],
                carbs=food['carbs'],
                protein=food['protein'],
                fats=food['fats'],
                calories=food['calories']
            )

        self.stdout.write(self.style.SUCCESS('Successfully added 10 food items to the database'))