import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../utils/app_colors.dart';

class DetailsAppBar extends StatelessWidget {
  const DetailsAppBar({super.key});

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
            "Details",
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24),
          ),
          IconButton(
            onPressed: () {},
            icon: FaIcon(
              true ? FontAwesomeIcons.solidHeart : FontAwesomeIcons.heart,
              color: AppColors.red,
              size: 24,
            ),
          ),
        ],
      ),
    );
  }
}
