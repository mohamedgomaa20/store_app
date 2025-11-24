import 'package:flutter/cupertino.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../utils/app_colors.dart';

class SkeletonizerForImage extends StatelessWidget {
  const SkeletonizerForImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      enableSwitchAnimation: true,
      effect: ShimmerEffect(
        baseColor: AppColors.primaryColor.withValues(alpha: 0.5),
        highlightColor: AppColors.primaryColor.withValues(alpha: 0.2),
      ),
      child: Container(
        color: AppColors.primaryColor.withValues(alpha: 0.5),
        height: double.infinity,
        width: double.infinity,
      ),
    );
  }
}
