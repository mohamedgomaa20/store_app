import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/widgets/product_image_section.dart';

import '../widgets/details_app_bar.dart';
import '../widgets/price_and_add_to_cart_section.dart';
import '../widgets/product_info_section.dart';

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
                    ProductImageSection(productModel: productModel),
                    Gap(10),
                    ProductInfoSection(productModel: productModel),
                    Gap(10),
                  ],
                ),
              ),
            ),

            PriceAndAddToCartSection(productModel: productModel, onAdd: () {}),
          ],
        ),
      ),
    );
  }
}
