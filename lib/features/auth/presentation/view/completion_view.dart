import 'dart:developer';
import 'package:bazar/core/routing/route_paths.dart';
import 'package:bazar/features/auth/presentation/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

/// Displays Completion status for Registration || Password Reset
class CompletionView extends StatelessWidget {
  final bool isPasswordReset;
  const CompletionView({super.key, required this.isPasswordReset});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w), 
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/onboarding_images/completion.png',
                height: 91.h,  
                width: 160.w,  
              ),
              SizedBox(height: 32.h),

              // Title
              Text(
                isPasswordReset ? "Password Changed" : 'Congratulations!',
                style: textTheme.displaySmall?.copyWith(
                  fontSize: 28.sp, // responsive title
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 8.h),

              // Subtitle
              Text(
                isPasswordReset
                    ? "Password changed successfully, you can login again with a new password"
                    : 'Your account is complete, please enjoy the best menu from us.',
                style: textTheme.bodyLarge?.copyWith(
                  fontSize: 16.sp, 
                  color: Colors.grey.shade500,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 40.h),

              // Get Started / Login Button
              CustomButton(
                buttonText: isPasswordReset ? "Login" : 'Get Started',
                onTap: () {
                  log('Get Started button pressed!');
                  context.go(RoutePaths.login);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
