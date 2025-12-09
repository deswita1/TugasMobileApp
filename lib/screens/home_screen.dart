import 'package:flutter/material.dart';
import '../widgets/category_card.dart';
import 'meal_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  final List<String> categories = const [
    "Chicken Katsu",
    "Chicken Teriyaki",
    "Burger",
    "Salad",
    "Beef Bulgogi",
    "Beef Steak",
    "Ice Water",
    "Lemonade",
    "Fruit Platter",
    "Iced Tea",
  ];

  final Map<String, IconData> foodIcons = const {
    "Chicken Katsu": Icons.restaurant,
    "Chicken Teriyaki": Icons.ramen_dining,
    "Burger": Icons.lunch_dining,
    "Salad": Icons.eco,
    "Beef Bulgogi": Icons.local_fire_department,
    "Beef Steak": Icons.set_meal,
    "Ice Water": Icons.water_drop,
    "Lemonade": Icons.local_drink,
    "Fruit Platter": Icons.apple,
    "Iced Tea": Icons.emoji_food_beverage,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: const Text(
          "Pick Your Category",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.orange,
          ),
        ),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(15),
        child: GridView.builder(
          itemCount: categories.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 15,
            mainAxisSpacing: 15,
            childAspectRatio: 1.1,
          ),
          itemBuilder: (context, index) {
            final title = categories[index];
            final icon = foodIcons[title] ?? Icons.fastfood;

            return CategoryCard(
              title: title,
              icon: icon,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => MealScreen(category: title),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
