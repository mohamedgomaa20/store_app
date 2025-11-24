import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.title, this.trailingWidger});

  final String title;

  final Widget? trailingWidger;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_rounded, color: AppColors.primaryColor),
          ),
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24),
          ),
          trailingWidger ?? SizedBox(width: 40),
        ],
      ),
    );
    ;
  }
}
