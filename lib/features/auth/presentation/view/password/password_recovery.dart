import 'package:bazar/core/routing/route_paths.dart';
import 'package:bazar/core/themes/app_colors.dart';
import 'package:bazar/features/auth/presentation/widgets/auth_section_header.dart';
import 'package:bazar/features/auth/presentation/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
/// Password Reset flow starts here
/// User decides to reset password based on Email or Phone Number 
class PasswordRecoveryView extends ConsumerStatefulWidget {
  const PasswordRecoveryView({super.key});

  @override
  ConsumerState<PasswordRecoveryView> createState() => _PasswordRecoveryViewState();
}

class _PasswordRecoveryViewState extends ConsumerState<PasswordRecoveryView> {
  // 0: none, 1: Email, 2: Phone Number
  int _selectedOption = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: const BackButton(color: Colors.black),
        toolbarHeight: 50,
      ),
      body: Column(
        children: [
          const AuthSectionHeader(
            title: "Forgot Password",
            subtitle:
                "Select which contact details should we use to reset your password",
          ),
          const SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildOptionCard(
                  icon: Icons.mail,
                  title: 'Email',
                  subtitle: 'Send to your email',
                  value: 1,
                ),
                const SizedBox(width: 16),
                _buildOptionCard(
                  icon: Icons.phone,
                  title: 'Phone Number',
                  subtitle: 'Send to your phone',
                  value: 2,
                ),
              ],
            ),
          ),
          const SizedBox(height: 40),
          CustomButton(
            buttonText: "Continue",
            onTap: () {
              if (_selectedOption == 0) return;
              context.push("${RoutePaths.passwordResetViewBase}/$_selectedOption");
              // Navigator.of(context).push(
              //   MaterialPageRoute(
              //     builder: (context) =>
              //         PasswordResetView(value: _selectedOption),
              //   ),
              // );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildOptionCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required int value,
  }) {
    final isSelected = _selectedOption == value;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedOption = value;
        });
      },
      child: Container(
        height: 158,
        width: 151,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected ? AppColors.primary500 : Colors.grey.shade300,
            width: 2,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 24,
              color: isSelected ? AppColors.primary500 : Colors.black,
            ),
            const SizedBox(height: 16),
            Text(
              title,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: isSelected ? AppColors.primary500 : Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
              textAlign: TextAlign.start,
            ),
            const SizedBox(height: 4),
            Text(
              subtitle,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: isSelected ? const Color(0xFF673AB7) : Colors.grey,
                  ),
              textAlign: TextAlign.start,
            ),
          ],
        ),
      ),
    );
  }
}
