import 'package:bazar/core/themes/app_colors.dart';
import 'package:bazar/features/home/models/book.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavoritesTile extends StatelessWidget {
  final Book book;
  final Color coverColor;
  final VoidCallback onRemove;

  const FavoritesTile({
    super.key,
    required this.book,
    required this.coverColor,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        height: 48.h,
        width: 48.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          color: coverColor,
        ),
        child: Center(
          child: Icon(
            Icons.book,
            color: Colors.white,
            size: 24.sp,
          ),
        ),
      ),
      title: Text(
        book.name,
        style: TextStyle(fontSize: 14.sp),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            book.author,
            style: TextStyle(color: Colors.grey[600], fontSize: 12.sp),
          ),
          Text(
            book.price,
            style: TextStyle(
              color: AppColors.primary500,
              fontWeight: FontWeight.bold,
              fontSize: 13.sp,
            ),
          ),
        ],
      ),
      trailing: IconButton(
        onPressed: onRemove,
        icon: Icon(
          CupertinoIcons.heart_fill,
          color: Colors.red,
          size: 20.sp,
        ),
      ),
    );
  }
}
