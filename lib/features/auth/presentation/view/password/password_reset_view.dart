import 'dart:developer';

import 'package:bazar/core/routing/route_paths.dart';
import 'package:bazar/core/utils/form_validator.dart';
import 'package:bazar/features/auth/model/reset_method.dart';
import 'package:bazar/features/auth/presentation/widgets/auth_section_header.dart';
import 'package:bazar/features/auth/presentation/widgets/custom_button.dart';
import 'package:bazar/features/auth/presentation/widgets/labeled_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl_phone_field/intl_phone_field.dart';


/// Conditional Password Reset View
/// It initiates the password reset flow by sending OTP to either Email or Phone Number
///
/// Value 1 = Email & Value 2 = Phone Number

class PasswordResetView extends ConsumerStatefulWidget {
  final int value;
  const PasswordResetView({super.key, required this.value});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PasswordResetViewState();
}

class _PasswordResetViewState extends ConsumerState<PasswordResetView> {
  String? _phoneNumber;
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future<void> _phonePasswordReset() async {
    FocusScope.of(context).unfocus();
    if (_phoneNumber == null || _phoneNumber!.isEmpty) return;
    final user = ResetMethod(type: 2, value: _phoneNumber!);
    context.push(RoutePaths.passwordVerificationView,
    extra: user);
    // Navigator.of(context).push(
    //   MaterialPageRoute(
    //     builder: (context) => PasswordVerificationView(userDetails: user),
    //   ),
    // );
  }

  Future<void> _emailPasswordReset() async {
    FocusScope.of(context).unfocus();
    if (_emailController.text.isEmpty) return;
    final user = ResetMethod(type: 1, value: _emailController.text);
    context.push(RoutePaths.passwordVerificationView,
    extra: user);
    // Navigator.of(context).push(
    //   MaterialPageRoute(
    //     builder: (context) => PasswordVerificationView(userDetails: user),
    //   ),
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: BackButton(color: Colors.black)),
      body: Column(
        children: [
          AuthSectionHeader(
            title: "Password Reset",
            subtitle: widget.value == 1
                ? "Please enter your email, we will send a verification code to your email."
                : "Please enter your phone number, we will send a verification code to your phone number.",
          ),
          widget.value == 1
              ? LabeledTextField(
                  label: "Email",
                  hint: "Enter your email",
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  validator: FormValidators.validateEmail,
                )
              : SizedBox(
                width: 320,
                child: IntlPhoneField(
                    decoration: InputDecoration(
                      suffixIcon: Icon(CupertinoIcons.phone),
                      labelText: 'Phone Number',
                      border: OutlineInputBorder(borderSide: BorderSide()),
                    ),
                    initialCountryCode: 'NG',
                    onChanged: (phone) {
                      log(phone.completeNumber);
                
                      // 2. Store the complete number in your state variable
                      setState(() {
                        _phoneNumber = phone.completeNumber;
                      });
                    },
                  ),
              ),
          SizedBox(height: 24),
          CustomButton(
            buttonText: "Send",
            onTap: widget.value == 1
                ? _emailPasswordReset
                : _phonePasswordReset,
          ),
        ],
      ),
    );
  }
}
