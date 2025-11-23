import 'package:flutter/material.dart';

import 'category_item.dart';

class CategoriesWidget extends StatefulWidget {
  const CategoriesWidget({super.key});

  @override
  State<CategoriesWidget> createState() => _CategoriesWidgetState();
}

final categoriesList = [
  "electronics",
  "jewelery",
  "men's clothing",
  "women's clothing",
];
int selectedIndex = 0;

class _CategoriesWidgetState extends State<CategoriesWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.builder(
        itemCount: categoriesList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return CategoryItem(
            isSelected: selectedIndex == index,
            categoryName: categoriesList[index],
            onTap: () {
              setState(() => selectedIndex = index);
            },
          );
        },
      ),
    );
  }
}
