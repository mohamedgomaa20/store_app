import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:store_app/utils/app_colors.dart';

import '../providers/product_provider.dart';
import 'category_item.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({super.key});

  final List<String> getDummyCategories = const [
    "all",
    "electronics",
    "jewelery",
    "men's clothing",
    "women's clothing",
    "men's clothing",
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductProvider>(
      builder: (context, provider, child) {
        final categories = provider.categoriesList;
        List<String> categoriesDisplay = categories.length == 1
            ? getDummyCategories
            : categories;
        return Skeletonizer(
          enabled: provider.isLoadingCategories,
          enableSwitchAnimation: true,
          effect: ShimmerEffect(
            baseColor: AppColors.primaryColor.withValues(alpha: 0.5),
            highlightColor: AppColors.primaryColor.withValues(alpha: 0.2),
          ),
          child: SizedBox(
            height: 40,
            child: ListView.builder(
              itemCount: categoriesDisplay.length,
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.only(left: 15, right: 5),
              itemBuilder: (context, index) {
                return CategoryItem(
                  isSelected: provider.selectedIndex == index,
                  categoryName: categoriesDisplay[index],
                  onTap: () {
                    provider.changeCategoryIndex(index);
                    provider.getProductsByCategory(categoriesDisplay[index]);
                  },
                );
              },
            ),
          ),
        );
      },
    );
  }
}
