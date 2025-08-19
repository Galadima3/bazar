import 'dart:developer';
import 'package:bazar/core/routing/route_paths.dart';
import 'package:bazar/features/auth/presentation/widgets/custom_button.dart';
import 'package:flutter/material.dart';
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
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/onboarding_images/completion.png',
                height: 91,
                width: 160,
              ),
              const SizedBox(height: 32),

              // Title
              Text(
                isPasswordReset ? "Password Changed": 'Congratulations!',
                style: textTheme.displaySmall,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),

              // Subtitle
              Text(
                isPasswordReset ? "Password changed successfully, you can login again with a new password" : 'Your account is complete, please enjoy the best menu from us.',
                style: textTheme.bodyLarge?.copyWith(
                  color: Colors.grey.shade500,
                ),

                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),

              // Get Started Button
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
