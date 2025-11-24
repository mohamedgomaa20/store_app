import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.title,
    this.icon,
    this.isOutLined = false,
    this.height,
    this.width,
    this.fontSize,
    this.iconSize,
    this.backgroundColor,
    required this.onTap,
  });

  final String title;
  final VoidCallback onTap;
  final IconData? icon;
  final bool isOutLined;
  final double? height;
  final double? width;
  final double? fontSize;
  final double? iconSize;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 55,
      width: width ?? .infinity,
      child: ElevatedButton.icon(
        onPressed: onTap,
        label: Text(
          title,
          style: TextStyle(
            fontSize: fontSize ?? 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        icon: icon == null ? null : Icon(icon, size: iconSize ?? 20),
        style: ElevatedButton.styleFrom(
          foregroundColor: isOutLined
              ? backgroundColor ?? AppColors.primaryColor
              : AppColors.white,
          backgroundColor: isOutLined
              ? Colors.white
              : backgroundColor ?? AppColors.primaryColor,

          shape: RoundedRectangleBorder(
            borderRadius: .circular(12),
            side: BorderSide(
              color: isOutLined
                  ? backgroundColor ?? AppColors.primaryColor
                  : Colors.transparent,
            ),
          ),
        ),
      ),
    );
  }
}
