import 'dart:developer';

import 'package:bazar/core/utils/form_validator.dart';
import 'package:bazar/features/auth/model/reset_method.dart';
import 'package:bazar/features/auth/presentation/view/conditional_password_verification_view.dart';
import 'package:bazar/features/auth/presentation/widgets/auth_section_header.dart';
import 'package:bazar/features/auth/presentation/widgets/custom_button.dart';
import 'package:bazar/features/auth/presentation/widgets/labeled_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

/// Value 1 = Email & Value 2 = Phone Number

class ConditionalPasswordResetView extends ConsumerStatefulWidget {
  final int value;
  const ConditionalPasswordResetView({super.key, required this.value});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ConditionalPasswordResetViewState();
}

class _ConditionalPasswordResetViewState
    extends ConsumerState<ConditionalPasswordResetView> {
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
    // final user = [2, _phoneNumber];
    final user = ResetMethod(type: 2, value: _phoneNumber!);
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) =>
            ConditionalPasswordVerificationView(userDetails: user),
      ),
    );
  }

  Future<void> _emailPasswordReset() async {
      FocusScope.of(context).unfocus(); 
    if (_emailController.text.isEmpty) return;
    final user = ResetMethod(type: 1, value: _emailController.text);
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) =>
            ConditionalPasswordVerificationView(userDetails: user),
      ),
    );
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
                ? "Please enter your email, we will send verification code to your email."
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
              : IntlPhoneField(
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
