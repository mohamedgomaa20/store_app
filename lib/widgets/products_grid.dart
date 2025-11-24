import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:store_app/widgets/product_card.dart';

import '../utils/app_colors.dart';

class ProductsGrid extends StatelessWidget {
  const ProductsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: false,
      enableSwitchAnimation: true,
      effect: ShimmerEffect(
        baseColor: AppColors.primaryColor.withValues(alpha: 0.5),
        highlightColor: AppColors.primaryColor.withValues(alpha: 0.2),
      ),
      child: GridView.builder(
        itemCount: 10,
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.66,
          mainAxisSpacing: 5,
        ),
        itemBuilder: (context, index) {
          return ProductCard(isLoading: true);
        },
      ),
    );
  }
}
