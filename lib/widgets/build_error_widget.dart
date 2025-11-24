import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../utils/app_colors.dart';

class BuildErrorWidget extends StatelessWidget {
  const BuildErrorWidget({super.key, required this.errorMessage});

  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: .all(20),
      child: Column(
        children: [
          Icon(
            Icons.error_outline,
            size: 64,
            color: AppColors.red.withValues(alpha: 0.5),
          ),
          Gap(20),
          Text(
            errorMessage,
            textAlign: .center,
            style: TextStyle(fontSize: 16, color: AppColors.red),
          ),
        ],
      ),
    );
  }
}
