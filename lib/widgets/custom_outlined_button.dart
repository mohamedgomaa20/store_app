import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../screens/register_screen.dart';
import '../utils/app_colors.dart';

class CustomOutlinedButton extends StatelessWidget {
  const CustomOutlinedButton({
    super.key,
    required this.onPressed,
    required this.text,
  });

  final VoidCallback onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Align(
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: AppColors.gray.withValues(alpha: 0.8),
          ),
        ),
      ),
    );
    ;
  }
}
