import 'package:bazar/core/themes/app_colors.dart';
import 'package:bazar/core/utils/form_validator.dart';
import 'package:bazar/features/auth/presentation/view/completion_view.dart';
import 'package:bazar/features/auth/presentation/widgets/auth_section_header.dart';
import 'package:bazar/features/auth/presentation/widgets/labeled_textfield.dart';
import 'package:flutter/material.dart';

/// User Enters New Password here

class NewPasswordView extends StatefulWidget {
  const NewPasswordView({super.key});

  @override
  State<NewPasswordView> createState() => _NewPasswordViewState();
}

class _NewPasswordViewState extends State<NewPasswordView> {
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  bool isVisible = false;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: BackButton(color: Colors.black)),
      body: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              AuthSectionHeader(
                title: "New Password",
                subtitle:
                    "Create your new password so you can login to your account",
              ),
              SizedBox(
                height: 24,
              ),
              LabeledTextField(
                label: "Password",
                hint: "Create a password",
                controller: passwordController,
                obscureText: !isVisible,
                onChanged: (value) => setState(() {
                  value = passwordController.text;
                }),
                suffix: IconButton(
                  icon: Icon(isVisible ? Icons.visibility : Icons.visibility_off),
                  onPressed: () {
                    setState(() {
                      isVisible = !isVisible;
                    });
                  },
                ),
                validator: FormValidators.validatePassword,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 6.0, left: 17),
                child: Row(
                  children: [
                    _inlineHint("8+ chars", passwordController.text.length >= 8),
                    const SizedBox(width: 12),
                    _inlineHint(
                        "Number", passwordController.text.contains(RegExp(r'[0-9]'))),
                    const SizedBox(width: 12),
                    _inlineHint(
                      "Letter",
                      passwordController.text.contains(RegExp(r'[A-Za-z]')),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              // Confirm Password Field
              LabeledTextField(
                label: "Confirm Password",
                hint: "Re-enter your password",
                controller: confirmPasswordController,
                obscureText: !isVisible, // Use the same visibility state
                suffix: IconButton(
                  icon: Icon(isVisible ? Icons.visibility : Icons.visibility_off),
                  onPressed: () {
                    setState(() {
                      isVisible = !isVisible;
                    });
                  },
                ),
                validator: (val) {
                  if (val == null || val.isEmpty) {
                    return "Please confirm your password";
                  }
                  if (val != passwordController.text) {
                    return "Passwords do not match";
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 31,
              ),
              SizedBox(
                width: 327,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Passwords match and are valid, proceed with logic
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Password updated successfully!'),
                        ),
                      );

                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            CompletionView(isPasswordReset: true),
                      ));
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary500,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Continue',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _inlineHint(String text, bool isValid) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          isValid ? Icons.check_circle : Icons.radio_button_unchecked,
          size: 15,
          color: isValid ? Colors.green : Colors.grey,
        ),
        const SizedBox(width: 4),
        Text(
          text,
          style: TextStyle(
            fontSize: 13,
            color: isValid ? Colors.green : Colors.grey,
          ),
        ),
      ],
    );
  }
}