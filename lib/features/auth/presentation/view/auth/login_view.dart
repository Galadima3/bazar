import 'dart:developer';
import 'package:bazar/core/routing/route_paths.dart';
import 'package:bazar/core/utils/form_validator.dart';
import 'package:bazar/features/auth/presentation/widgets/auth_footer_text.dart';
import 'package:bazar/features/auth/presentation/widgets/auth_section_header.dart';
import 'package:bazar/features/auth/presentation/widgets/labeled_textfield.dart';
import 'package:bazar/features/auth/presentation/widgets/or_divider.dart';
import 'package:bazar/features/auth/presentation/view/auth/sign_up_view.dart';
import 'package:bazar/features/auth/presentation/widgets/social_button.dart';
import 'package:bazar/features/auth/service/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final isPasswordVisibleProvider = StateProvider<bool>((ref) {
    return false;
  });

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: BackButton(color: Colors.black),
      ),
      body: Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: SingleChildScrollView(
          child: Column(
            children: [
              //Welcome text & subtext
              AuthSectionHeader(
                title: "Welcome Back 👋",
                subtitle: 'Sign to your account',
              ),

              // Email textfield
              LabeledTextField(
                label: "Email",
                hint: "Enter your email",
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                validator: FormValidators.validateEmail,
              ),

              SizedBox(height: 16),

              // Password textfield
              Consumer(
                builder: (context, ref, _) {
                  final isVisible = ref.watch(isPasswordVisibleProvider);
                  return LabeledTextField(
                    label: "Password",
                    hint: "Enter Your password",
                    controller: passwordController,
                    obscureText: !isVisible,
                    suffix: IconButton(
                      icon: Icon(
                        isVisible ? Icons.visibility : Icons.visibility_off,
                      ),
                      onPressed: () =>
                          ref.read(isPasswordVisibleProvider.notifier).state =
                              !isVisible,
                    ),
                    validator: FormValidators.validatePassword,
                  );
                },
              ),

              // Forgot password textbutton
              Padding(
                padding: const EdgeInsets.only(left: 7.5),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: TextButton(
                    onPressed: () =>
                        context.push(RoutePaths.passwordRecoveryView),
                    // onPressed: () => Navigator.of(context).push(
                    //   MaterialPageRoute(
                    //     builder: (context) => PasswordRecoveryView(),
                    //   ),
                    // ),
                    child: Text(
                      "Forgot Password?",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Color(0xff564290),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 24),

              // Login button
              SizedBox(
                height: 48,
                width: 327,
                child: ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      // All validators passed ✅
                      log(
                        "Email: ${emailController.text} & Password: ${passwordController.text}",
                      );
                      await AuthService.setUserAuthstatus();
                      if(!context.mounted) {
                        return;
                      }
                      context.pushReplacement(RoutePaths.home);
                    } else {
                      // Some field failed ❌
                      log("Validation failed");
                    }
                  },
                  child: Text("Login", style: TextStyle(color: Colors.white)),
                ),
              ),
              SizedBox(height: 24),

              // dont have acct...
              AuthFooterText(
                prefix: "Don't have an account? ",
                actionText: "Sign up",
                onTap: () => Navigator.of(
                  context,
                ).push(MaterialPageRoute(builder: (context) => SignUpView())),
              ),

              SizedBox(height: 24),

              OrDivider(),

              SizedBox(height: 24),

              // alt sign in
              SocialButton(
                assetPath: "google",
                label: 'Sign in with Google',
                onTap: () {},
              ),
              const SizedBox(height: 12),
              SocialButton(
                assetPath: "apple",
                label: 'Sign in with Apple',
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
