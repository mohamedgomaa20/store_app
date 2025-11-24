import 'package:flutter/material.dart';

import '../models/product_model.dart';
import 'cached_image_widget.dart';

class ProductImageSection extends StatelessWidget {
  const ProductImageSection({super.key, required this.productModel});

  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 370,
      width: .infinity,
      child: CachedImageWidget(imageUrl: productModel.image),
    );
  }
}
