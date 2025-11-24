import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:store_app/widgets/skeltonnizer_for_image.dart';

import '../utils/app_colors.dart';

class CachedImageWidget extends StatelessWidget {
  const CachedImageWidget({super.key, required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
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
    );
  }
}
