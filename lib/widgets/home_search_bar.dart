import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../utils/app_colors.dart';

class HomeSearchBar extends StatelessWidget {
  const HomeSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        decoration: const BoxDecoration(),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 15),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
              decoration: BoxDecoration(
                color: AppColors.primaryColor.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: AppColors.primaryColor.withValues(alpha: 0.3),
                  width: 1.5,
                ),
              ),

              child: Row(
                children: [
                  const Icon(
                    CupertinoIcons.search,
                    color: AppColors.primaryColor,
                    size: 28,
                  ),
                  const Gap(16),
                  const Text(
                    "Search for clothes...",
                    style: TextStyle(
                      color: AppColors.primaryColor,
                      fontSize: 16,
                    ),
                  ),
                  const Spacer(),

                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      gradient: LinearGradient(
                        colors: [
                          AppColors.primaryColor.withValues(alpha: 0.7),
                          AppColors.primaryColor,
                        ],
                      ),
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.arrow_forward,
                        color: AppColors.white,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
