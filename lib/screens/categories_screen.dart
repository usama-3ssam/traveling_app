import 'package:flutter/material.dart';
import 'package:traveling_app/widegs/categories_items.dart';
import '../app_data.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(10),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 7 / 8,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      children: categoriesData.map(
        (categoriesData) => CategoriesItems(
          categoriesData.id,
          categoriesData.title,
          categoriesData.imageUrl,
        ),
      ).toList(),
    );
  }
}
