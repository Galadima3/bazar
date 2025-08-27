import 'package:bazar/core/themes/app_colors.dart';
import 'package:bazar/features/home/models/book.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartItemTile extends StatelessWidget {
  final Book book;
  final Color coverColor;
  final VoidCallback onRemove;

  const CartItemTile({
    super.key,
    required this.book,
    required this.coverColor,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return ListTile(
      leading: Container(
        height: 48.h,
        width: 48.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          color: coverColor,
        ),
        child: Center(
          child: Icon(Icons.book, color: Colors.white, size: 24.sp),
        ),
      ),
      title: Text(
        book.name,
        style: textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w700),

        overflow: TextOverflow.ellipsis,
        maxLines: 1,
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            book.author,
            style: textTheme.bodySmall?.copyWith(color: Colors.grey.shade600),
          ),
          Text(
            book.price,
            style: textTheme.bodySmall?.copyWith(
              color: AppColors.primary500,
              fontWeight: FontWeight.bold,
              fontSize: 13.sp,
            ),
          ),
        ],
      ),
      trailing: IconButton(
        onPressed: onRemove,
        icon: Icon(CupertinoIcons.trash, color: Colors.red, size: 20.sp),
      ),
    );
  }
}
