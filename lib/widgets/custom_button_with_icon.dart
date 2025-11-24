import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

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
    this.isRightIcon = false,
    this.isLoading = false,
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
  final bool isRightIcon;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 55,
      width: width ?? .infinity,
      child: ElevatedButton(
        onPressed: onTap,
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

        child: Row(
          mainAxisAlignment: .center,
          children: isRightIcon
              ? isLoading
                    ? [
                        CircularProgressIndicator(
                          color: AppColors.white,
                          strokeWidth: 5,
                        ),
                      ]
                    : [
                        Text(
                          title,
                          style: TextStyle(
                            fontSize: fontSize ?? 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        if (icon != null) ...[
                          Gap(10),
                          Icon(icon, size: iconSize ?? 20),
                        ],
                      ]
              : isLoading
              ? [
                  CircularProgressIndicator(
                    color: AppColors.white,
                    strokeWidth: 5,
                  ),
                ]
              : [
                  if (icon != null) ...[
                    Icon(icon, size: iconSize ?? 20),
                    Gap(10),
                  ],
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: fontSize ?? 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
        ),
      ),
    );
  }
}
