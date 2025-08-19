import 'dart:developer';
import 'package:bazar/features/auth/presentation/view/verification/phone_verification_view.dart';
import 'package:bazar/features/auth/presentation/widgets/custom_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class PhoneInputView extends StatefulWidget {
  const PhoneInputView({super.key});

  @override
  State<PhoneInputView> createState() => _PhoneInputViewState();
}

class _PhoneInputViewState extends State<PhoneInputView> {
  String? _phoneNumber;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(color: Colors.black),
        elevation: 0,
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
                    "Phone Number",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Please enter your phone number, so we can more easily deliver your order",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey.shade500),
                  ),
                ],
              ),
            ),
            SizedBox(height: 24),

            //Phone
            IntlPhoneField(
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
            SizedBox(height: 81),

            //Button
            CustomButton(
              buttonText: "Continue",
              onTap: () {
                log(_phoneNumber!);
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => PhoneVerificationView(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
