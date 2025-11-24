import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../utils/app_colors.dart';

class NoProductWidget extends StatelessWidget {
  const NoProductWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: .all(20),
      child: Column(
        children: [
          Icon(
            Icons.shopping_bag_outlined,
            size: 64,
            color: AppColors.gray.withValues(alpha: 0.5),
          ),
          Gap(20),
          Text(
            "No products found",
            textAlign: .center,
            style: TextStyle(fontSize: 18, color: AppColors.gray),
          ),
        ],
      ),
    );
  }
}
