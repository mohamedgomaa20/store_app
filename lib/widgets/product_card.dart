import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/utils/app_colors.dart';
import 'package:store_app/widgets/skeltonnizer_for_image.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    this.isLoading = false,
    required this.productModel,
  });

  final bool isLoading;
  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width / 2 - 20,
      child: Card(
        color: AppColors.white,
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: .start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: .circular(12),
                  child: CachedNetworkImage(
                    imageUrl: productModel.image,
                    height: 200,
                    fit: .contain,
                    placeholder: (context, url) {
                      return SkeletonizerForImage();
                    },
                    errorWidget: (context, url, error) {
                      return Container(
                        width: .infinity,
                        color: AppColors.primaryColor.withValues(alpha: 0.5),
                        child: Icon(
                          Icons.production_quantity_limits_rounded,
                          color: AppColors.white.withValues(alpha: 0.5),
                          size: 100,
                        ),
                      );
                    },
                  ),
                ),
                if (!isLoading)
                  Positioned(
                    right: 10,
                    top: 10,
                    child: Container(
                      width: 35,
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        shape: .circle,
                      ),
                      child: IconButton(
                        onPressed: () {},
                        icon: FaIcon(
                          true
                              ? FontAwesomeIcons.solidHeart
                              : FontAwesomeIcons.heart,
                          color: AppColors.white,
                          size: 18,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            Gap(10),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8),
              child: Column(
                children: [
                  Text(
                    productModel.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  Gap(8),
                  Row(
                    children: [
                      Text(
                        "\$ ${productModel.price}",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: AppColors.gray,
                        ),
                      ),
                      Gap(10),
                      FaIcon(
                        FontAwesomeIcons.solidStar,
                        color: AppColors.gold,
                        size: 14,
                      ),
                      Gap(5),
                      Text(
                        "${productModel.rating!.rate}",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: AppColors.gray,
                        ),
                      ),
                    ],
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
