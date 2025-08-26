import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SocialButton extends StatelessWidget {
  final String assetPath; // path to svg file in assets
  final String label;
  final VoidCallback onTap;

  const SocialButton({
    required this.assetPath,
    required this.label,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: OutlinedButton.icon(
        icon: SvgPicture.asset(
          "assets/icons/$assetPath.svg",
          height: 20.h,
          width: 20.w,
        ),
        label: Padding(
          padding: const EdgeInsets.symmetric(vertical: 14.0),
          child: Text(
            label,
            style: const TextStyle(color: Colors.black),
          ),
        ),
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.r),
          ),
          side: const BorderSide(color: Colors.black12),
          minimumSize:  Size.fromHeight(50.h),
        ),
        onPressed: onTap,
      ),
    );
  }
}
