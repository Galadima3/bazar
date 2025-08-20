import 'package:bazar/core/themes/app_colors.dart';
import 'package:flutter/material.dart';

class CategoryHeader extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  const CategoryHeader({
    super.key,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: textTheme.headlineMedium),
          TextButton(
            style: TextButton.styleFrom(
              padding: EdgeInsets.zero,
              minimumSize: Size.zero,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            onPressed: onPressed,
            child: Text(
              "See all",
              style: textTheme.bodyMedium?.copyWith(
                color: AppColors.primary500,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}