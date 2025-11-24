import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../utils/app_colors.dart';
import 'custom_app_bar.dart';

class DetailsAppBar extends StatelessWidget {
  const DetailsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      title: "Details",
      trailingWidger: IconButton(
        onPressed: () {},
        icon: FaIcon(
          true ? FontAwesomeIcons.solidHeart : FontAwesomeIcons.heart,
          color: AppColors.red,
          size: 24,
        ),
      ),
    );
  }
}
