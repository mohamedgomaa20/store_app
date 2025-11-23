import 'package:flutter/material.dart';
import 'package:store_app/utils/app_colors.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    this.isSelected = true,
    required this.categoryName,
    required this.onTap,
  });

  final bool isSelected;
  final String categoryName;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        padding: .symmetric(vertical: 10, horizontal: 20),
        margin: .only(right: 8),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primaryColor : AppColors.white,
          borderRadius: BorderRadius.circular(12),
          border: .all(
            color: isSelected ? AppColors.white : AppColors.primaryColor,
            width: 0.5,
          ),
        ),
        child: Text(
          categoryName,
          style: TextStyle(
            color: isSelected ? Colors.white : AppColors.primaryColor,
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
