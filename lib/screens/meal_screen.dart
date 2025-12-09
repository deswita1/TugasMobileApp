import 'package:flutter/material.dart';
import '../data/food_data.dart';

class MealScreen extends StatelessWidget {
  final String category;

  const MealScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    final foods = foodData[category] ?? [];

    return Scaffold(
      appBar: AppBar(title: Text(category)),
      body: foods.isEmpty
          ? const Center(child: Text("No Foods"))
          : ListView.builder(
              itemCount: foods.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.all(10),
                  child: ListTile(
                    leading: const Icon(Icons.restaurant_menu),
                    title: Text(foods[index]['name']!),
                    trailing: Text("Rp ${foods[index]['price']}"),
                  ),
                );
              },
            ),
    );
  }
}
