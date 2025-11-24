import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../models/product_model.dart';
import '../utils/app_colors.dart';

class ProductInfoSection extends StatelessWidget {
  const ProductInfoSection({super.key, required this.productModel});

  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Container(
            padding: .symmetric(horizontal: 15, vertical: 10),
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              productModel.category.replaceFirst(
                productModel.category[0],
                productModel.category[0].toUpperCase(),
              ),
              style: TextStyle(color: Colors.white),
            ),
          ),
          Gap(10),
          Text(
            productModel.title,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
          ),
          Gap(14),
          Row(
            children: [
              Icon(Icons.star, size: 24, color: AppColors.gold),
              Gap(5),
              Row(
                children: [
                  Text(
                    "${productModel.rating!.rate}/5",
                    style: TextStyle(
                      fontSize: 18,
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    " (${productModel.rating!.count} reviews )",
                    style: TextStyle(fontSize: 16, color: AppColors.gray),
                  ),
                ],
              ),
            ],
          ),
          Gap(14),
          Text(
            "Description",
            style: TextStyle(fontSize: 22, fontWeight: .bold),
          ),

          Gap(10),
          Text(
            productModel.description,
            style: TextStyle(fontSize: 15, color: AppColors.gray),
          ),
          Gap(40),
        ],
      ),
    );
  }
}
