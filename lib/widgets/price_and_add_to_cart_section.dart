import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../models/product_model.dart';
import '../utils/app_colors.dart';
import 'custom_button_with_icon.dart';

class PriceAndAddToCartSection extends StatelessWidget {
  const PriceAndAddToCartSection({
    super.key,
    required this.productModel,
    required this.onAdd,
  });

  final ProductModel productModel;
  final VoidCallback onAdd;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: .symmetric(horizontal: 20, vertical: 15),
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border(
          top: BorderSide(color: AppColors.primaryColor, width: 1),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryColor.withValues(alpha: 0.1),
            blurRadius: 5,
            offset: Offset(0, -5),
          ),
        ],
      ),
      child: Row(
        children: [
          Column(
            children: [
              Text(
                "price",
                style: TextStyle(fontSize: 16, color: AppColors.gray),
              ),
              Gap(5),
              Text(
                "\$${productModel.price}",
                style: TextStyle(
                  fontSize: 24,
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          Gap(15),
          Expanded(
            child: CustomElevatedButton(
              title: "Add to cart",
              icon: Icons.shopping_cart_outlined,
              onTap: onAdd,
            ),
          ),
        ],
      ),
    );
  }
}
