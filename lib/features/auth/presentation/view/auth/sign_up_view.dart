import 'package:bazar/core/utils/form_validator.dart';
import 'package:bazar/features/auth/presentation/view/verification/email_verification_view.dart';
import 'package:bazar/features/auth/presentation/widgets/auth_footer_text.dart';
import 'package:bazar/features/auth/presentation/widgets/auth_section_header.dart';
import 'package:bazar/features/auth/presentation/widgets/labeled_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final isPasswordVisibleProvider = StateProvider<bool>((ref) => false);
final passwordProvider = StateProvider<String>((ref) => "");

class SignUpView extends ConsumerStatefulWidget {
  const SignUpView({super.key});

  @override
  ConsumerState<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends ConsumerState<SignUpView> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _nameController;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isVisible = ref.watch(isPasswordVisibleProvider);
    final password = ref.watch(passwordProvider);

    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.white,
        leading: const BackButton(color: Colors.black),
      ),
      body: Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: SingleChildScrollView(
          child: Column(
            children: [
              /// Title & subtitle
              const AuthSectionHeader(
                title: "Create Account",
                subtitle: "Sign up to get started",
              ),

              // Name field
              LabeledTextField(
                label: "Name",
                hint: "Enter your full name",
                controller: _nameController,
                validator: FormValidators.validateUsername,
              ),
              const SizedBox(height: 16),

              // Email field
              LabeledTextField(
                label: "Email",
                hint: "Enter your email",
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                validator: FormValidators.validateEmail,
              ),
              const SizedBox(height: 16),

              // Password field
              LabeledTextField(
                label: "Password",
                hint: "Create a password",
                controller: _passwordController,
                obscureText: !isVisible,
                suffix: IconButton(
                  icon: Icon(
                    isVisible ? Icons.visibility : Icons.visibility_off,
                  ),
                  onPressed: () {
                    ref.read(isPasswordVisibleProvider.notifier).state =
                        !isVisible;
                  },
                ),
                onChanged: (val) =>
                    ref.read(passwordProvider.notifier).state = val,
                validator: FormValidators.validatePassword,
              ),

              /// Inline strength (right under field)
              Padding(
                padding: const EdgeInsets.only(top: 6.0, left: 17),
                child: Row(
                  children: [
                    _inlineHint("8+ chars", password.length >= 8),
                    const SizedBox(width: 12),
                    _inlineHint("Number", password.contains(RegExp(r'[0-9]'))),
                    const SizedBox(width: 12),
                    _inlineHint(
                      "Letter",
                      password.contains(RegExp(r'[A-Za-z]')),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // Register button
              SizedBox(
                height: 48,
                width: 327,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const EmailVerificationView(),
                        ),
                      );
                    }
                  },
                  child: const Text(
                    "Register",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Footer text
              AuthFooterText(
                prefix: "Already have an account? ",
                actionText: "Sign in",
                onTap: () => Navigator.of(context).pop(),
              ),

              

             

              const SizedBox(height: 100),

              /// Terms notice
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Text.rich(
                  TextSpan(
                    text: 'By signing up, you agree to our ',
                    style: const TextStyle(color: Colors.grey, fontSize: 14),
                    children: [
                      TextSpan(
                        text: 'Terms and Data Policy',
                        style: const TextStyle(
                          color: Color(0xff564290),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 20),
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
