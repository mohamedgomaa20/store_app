import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/screens/details_screen.dart';
import 'package:store_app/widgets/product_card.dart';

import '../utils/app_colors.dart';

class ProductsGrid extends StatelessWidget {
  const ProductsGrid({
    super.key,
    required this.products,
    required this.isLoading,
  });

  final List<ProductModel> products;
  final bool isLoading;

  List<ProductModel> _getDummyData() {
    return List.generate(
      10,
      (index) => ProductModel(
        id: 1,
        title: "",
        price: 109.058,
        description: "",
        category: "",
        image: " ",
        rating: RatingModel(rate: 3.9, count: 120),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var displayProducts = products.isEmpty ? _getDummyData() : products;
    return Skeletonizer(
      enabled: isLoading,
      enableSwitchAnimation: true,
      effect: ShimmerEffect(
        baseColor: AppColors.primaryColor.withValues(alpha: 0.5),
        highlightColor: AppColors.primaryColor.withValues(alpha: 0.2),
      ),
      child: GridView.builder(
        itemCount: displayProducts.length,
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.66,
          mainAxisSpacing: 5,
        ),
        itemBuilder: (context, index) {
          return ProductCard(
            isLoading: isLoading,
            productModel: displayProducts[index],
            onTap: isLoading
                ? null
                : () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            DetailsScreen(productModel: displayProducts[index]),
                      ),
                    );
                  },
          );
        },
      ),
    );
  }
}
