import 'dart:developer';
import 'package:bazar/features/auth/presentation/view/completion_view.dart';
import 'package:bazar/features/auth/presentation/widgets/custom_button.dart';
import 'package:flutter/material.dart';

/// Verify Phone Number During Registration/Onboarding
class PhoneVerificationView extends StatefulWidget {
  const PhoneVerificationView({super.key});

  @override
  State<PhoneVerificationView> createState() => _PhoneVerificationViewState();
}

class _PhoneVerificationViewState extends State<PhoneVerificationView> {
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
      appBar: AppBar(
        leading: const BackButton(color: Colors.black,),
        // elevation: 0,
        // backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            // Heading column
            Center(
              child: Column(
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
                  Text(
                    "(+20) 123477092 299",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),

            // OTP Field
            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 40, bottom: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(4, (index) {
                  return buildOtpField(index);
                }),
              ),
            ),

            // If you didnt...
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
            SizedBox(height: 43),

            // continue button
            CustomButton(
              buttonText: 'Continue',
              onTap: () {
                String otp = _getOtp(); // Get the combined OTP here
                log('Entered OTP: $otp');
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => CompletionView(isPasswordReset: false,),
                  ),
                );
              },
            ),
          ],
        ),
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

