import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:store_app/utils/app_colors.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key});

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
                    imageUrl:
                        "https://tse4.mm.bing.net/th/id/OIF.JmvQQwbFeQBf7agEJugPPg?pid=Api&P=0&h=220",
                    height: 200,
                    fit: .cover,
                  ),
                ),
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
                    "Mobile Mobile Mobile  Mobile  Mobile ",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  Gap(8),
                  Row(
                    children: [
                      Text(
                        "\$ 1,190",
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
                        "5.0",
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
