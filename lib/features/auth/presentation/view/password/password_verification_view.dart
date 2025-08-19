import 'dart:developer';
import 'package:bazar/core/routing/route_paths.dart';
import 'package:bazar/features/auth/model/reset_method.dart';
import 'package:bazar/features/auth/presentation/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

/// Conditional Password Verification View
/// It continues the password reset flow by allowing users verify OTP sent to email or Phone number
///

class PasswordVerificationView extends ConsumerStatefulWidget {
  final ResetMethod userDetails;
  const PasswordVerificationView({
    super.key,
    required this.userDetails,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PasswordVerificationViewState();
}

class _PasswordVerificationViewState
    extends ConsumerState<PasswordVerificationView> {
  final List<TextEditingController> _controllers = List.generate(
    4,
    (_) => TextEditingController(),
  );

  // create focus nodes for all controllers
  final List<FocusNode> _focusNodes = List.generate(4, (_) => FocusNode());

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var node in _focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  String _getOtp() {
    return _controllers.map((controller) => controller.text).join();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: BackButton(color: Colors.black)),
      body: Column(
        children: [
          Center(
            child: widget.userDetails.type == 1
                ? Email(emailAddress: widget.userDetails.value)
                : Phone(phoneNumber: widget.userDetails.value),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Didn't receive a code? "),
              GestureDetector(
                onTap: () {
                  // navigate to sign in
                },
                child: const Text(
                  "Resend",
                  style: TextStyle(
                    color: Color(0xff564290),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 16.0, right: 16.0, top: 40, bottom: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(4, (index) {
                return buildOtpField(index);
              }),
            ),
          ),
          // continue button
          CustomButton(
            buttonText: 'Continue',
            onTap: () {
              FocusScope.of(context).unfocus();
              String otp = _getOtp(); // Get the combined OTP here
              log('Entered OTP: $otp');
              context.push(RoutePaths.newPassWordView);
              // Navigator.of(context).push(
              //   MaterialPageRoute(builder: (context) => NewPasswordView()),
              // );
            },
          ),
        ],
      ),
    );
  }

  Widget buildOtpField(int index) {
    return SizedBox(
      width: 50,
      height: 50,
      child: TextField(
        controller: _controllers[index],
        focusNode: _focusNodes[index],
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        maxLength: 1,
        onChanged: (value) {
          //This condition ensures that the current TextField is not the last one in the sequence.
          //The check index < 5 prevents trying to move focus to a non-existent next field.
          if (value.isNotEmpty && index < 3) {
            FocusScope.of(context).requestFocus(_focusNodes[index + 1]);
          }
          //managing focus in an OTP input field where the user may need to move backward when correcting an entry
          else if (value.isEmpty && index > 0) {
            FocusScope.of(context).requestFocus(_focusNodes[index - 1]);
          }
        },
        decoration: InputDecoration(
          counterText: '',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(9)),
        ),
      ),
    );
  }
}

class Phone extends StatelessWidget {
  final String phoneNumber;
  const Phone({super.key, required this.phoneNumber});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Phone Verification",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        Text(
          "Please enter the code sent to this phone number:",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.grey.shade500),
        ),
        Text(phoneNumber, style: TextStyle(fontWeight: FontWeight.bold)),
      ],
    );
  }
}

class Email extends StatelessWidget {
  final String emailAddress;
  const Email({super.key, required this.emailAddress});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Verification code",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        Text(
          "Please enter the code sent to this email address:",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.grey.shade500),
        ),
        Text(emailAddress, style: TextStyle(fontWeight: FontWeight.bold)),
      ],
    );
  }
}