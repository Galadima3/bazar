import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CouponCard extends StatelessWidget {
  final String discount;
  final Color color;

  const CouponCard({super.key, 
    required this.discount,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "$discount\nOFF",
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 12),
          ElevatedButton(
            onPressed: () {
              Clipboard.setData(ClipboardData(text: "$discount OFF"));
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("$discount coupon copied!")),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            ),
            child: const Text("Copy"),
          ),
        ],
      ),
    );
  }
}
