import 'package:flutter/material.dart';

class LabeledTextField extends StatelessWidget {
  final String label;
  final String hint;
  final TextEditingController controller;
  final bool obscureText;
  final Widget? suffix;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  // Add these new parameters
  final GestureTapCallback? onTap; // Callback for tap events
  final ValueChanged<String>? onChanged; // Callback for text changes

  const LabeledTextField({
    super.key,
    required this.label,
    required this.hint,
    required this.controller,
    this.obscureText = false,
    this.suffix,
    this.validator,
    this.keyboardType,
    this.onTap, // Initialize them in the constructor
    this.onChanged, // Initialize them in the constructor
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 327, // Consider making this dynamic or using MediaQuery
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Padding(
          //   padding: const EdgeInsets.only(bottom: 4.5),
          //   child: Text(
          //     label,
          //     style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
              
          //   ),
          // ),
          TextFormField(
            keyboardType: keyboardType,
            controller: controller,
            obscureText: obscureText,
            validator: validator,
            onTap: onTap, // Pass the onTap callback to TextFormField
            onChanged: onChanged, // Pass the onChanged callback to TextFormField
            decoration: InputDecoration(
              hintText: hint,
              labelText: label,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              suffixIcon: suffix,
            ),
          ),
        ],
      ),
    );
  }
}