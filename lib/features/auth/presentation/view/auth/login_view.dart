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
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
      appBar: AppBar(),
      body: SafeArea(
        child: Form(
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: LabeledTextField(
                    label: "Email",
                    hint: "Enter your email",
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    validator: FormValidators.validateEmail,
                  ),
                ),

                SizedBox(height: 16.h),

                // Password textfield
                Consumer(
                  builder: (context, ref, _) {
                    final isVisible = ref.watch(isPasswordVisibleProvider);
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0.h),
                      child: LabeledTextField(
                        label: "Password",
                        hint: "Enter Your password",
                        controller: passwordController,
                        obscureText: !isVisible,
                        suffix: IconButton(
                          icon: Icon(
                            isVisible ? Icons.visibility : Icons.visibility_off,
                          ),
                          onPressed: () =>
                              ref
                                      .read(isPasswordVisibleProvider.notifier)
                                      .state =
                                  !isVisible,
                        ),
                        validator: FormValidators.validatePassword,
                      ),
                    );
                  },
                ),

                // Forgot password textbutton
                Padding(
                  padding: EdgeInsets.only(left: 7.5.w),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: TextButton(
                      onPressed: () =>
                          context.push(RoutePaths.passwordRecoveryView),

                      child: Text(
                        "Forgot Password?",
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Theme.of(context).brightness == Brightness.dark
                              ? Colors.white
                              : Color(0xff564290),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 24.h),

                // Login button
                SizedBox(
                  height: 48.h,
                  width: 327.w,
                  child: ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        // All validators passed ✅
                        log(
                          "Email: ${emailController.text} & Password: ${passwordController.text}",
                        );
                        await AuthService.setUserAuthstatus();
                        if (!context.mounted) {
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
                SizedBox(height: 24.h),

                // dont have acct...
                AuthFooterText(
                  prefix: "Don't have an account? ",
                  actionText: "Sign up",
                  onTap: () => Navigator.of(
                    context,
                  ).push(MaterialPageRoute(builder: (context) => SignUpView())),
                ),

                SizedBox(height: 24.h),

                OrDivider(),

                SizedBox(height: 24.h),

                // alt sign in
                SocialButton(
                  assetPath: "google",
                  label: 'Sign in with Google',
                  onTap: () {},
                ),
                SizedBox(height: 12.h),
                SocialButton(
                  assetPath: "apple",
                  label: 'Sign in with Apple',
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
