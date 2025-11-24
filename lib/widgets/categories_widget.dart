import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:store_app/utils/app_colors.dart';

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
int selectedIndex = -1;

class _CategoriesWidgetState extends State<CategoriesWidget> {
  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: false,
      enableSwitchAnimation: true,
      effect: ShimmerEffect(
        baseColor: AppColors.primaryColor.withValues(alpha: 0.5),
        highlightColor: AppColors.primaryColor.withValues(alpha: 0.2),
      ),
      child: SizedBox(
        height: 40,
        child: ListView.builder(
          itemCount: categoriesList.length,
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.only(left: 15,right: 5),
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
      ),
    );
  }
}
