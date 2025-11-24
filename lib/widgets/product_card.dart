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
    this.onTap,
  });

  final bool isLoading;
  final ProductModel productModel;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isLoading ? null : onTap,
      child: Card(
        color: AppColors.white,
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: .start,
          children: [
            Stack(
              children: [
                SizedBox(
                  height: 200,
                  width: .infinity,
                  child: ClipRRect(
                    borderRadius: .circular(12),
                    child: isLoading
                        ? Container(
                            height: 200,
                            width: .infinity,
                            color: AppColors.gray,
                          )
                        : CachedNetworkImage(
                            imageUrl: productModel.image,
                            fit: .contain,
                            placeholder: (context, url) {
                              return SkeletonizerForImage();
                            },
                            errorWidget: (context, url, error) {
                              return Container(
                                width: .infinity,
                                color: AppColors.primaryColor.withValues(
                                  alpha: 0.5,
                                ),
                                child: Icon(
                                  Icons.production_quantity_limits_rounded,
                                  color: AppColors.white.withValues(alpha: 0.5),
                                  size: 100,
                                ),
                              );
                            },
                          ),
                  ),
                ),
                if (!isLoading)
                  Positioned(
                    right: 8,
                    top: 0,
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
                          color: AppColors.red,
                          size: 18,
                        ),
                      ),
                    ),
                  ),

                if (productModel.rating != null && !isLoading)
                  Positioned(
                    top: 8,
                    left: 8,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: AppColors.black.withValues(alpha: 0.7),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.star, color: AppColors.gold, size: 16),
                          Gap(4),
                          Text(
                            productModel.rating!.rate.toString(),
                            style: TextStyle(
                              color: AppColors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
            Gap(10),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8),
              child: Column(
                crossAxisAlignment: .start,
                children: [
                  Text(
                    productModel.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  Gap(8),
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
