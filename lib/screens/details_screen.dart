import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/utils/app_colors.dart';
import 'package:store_app/widgets/cached_image_widget.dart';

import '../widgets/custom_button_with_icon.dart';
import '../widgets/details_app_bar.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.productModel});

  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            DetailsAppBar(),

            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: .start,
                  children: [
                    Gap(10),
                    SizedBox(
                      height: 370,
                      width: .infinity,
                      child: CachedImageWidget(imageUrl: productModel.image),
                    ),
                    Gap(10),

                    Padding(
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
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w400,
                            ),
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
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: AppColors.gray,
                                    ),
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
                            style: TextStyle(
                              fontSize: 15,
                              color: AppColors.gray,
                            ),
                          ),
                          Gap(40),
                        ],
                      ),
                    ),
                    Gap(10),
                  ],
                ),
              ),
            ),

            Container(
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
                      onTap: () {},
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
