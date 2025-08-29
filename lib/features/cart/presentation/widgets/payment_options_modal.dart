import 'package:bazar/core/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaymentOptionsModal extends StatefulWidget {
  final String selectedPayment;
  final Function(String) onPaymentChanged;

  const PaymentOptionsModal({
    super.key,
    required this.selectedPayment,
    required this.onPaymentChanged,
  });

  @override
  State<PaymentOptionsModal> createState() => _PaymentOptionsModalState();
}

class _PaymentOptionsModalState extends State<PaymentOptionsModal> {
  late String localSelectedPayment;

  @override
  void initState() {
    super.initState();
    localSelectedPayment = widget.selectedPayment;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.40,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24.r),
          topRight: Radius.circular(24.r),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Handle bar
          Center(
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 12.h),
              width: 60.w,
              height: 4.h,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2.r),
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Text(
              "Your Payments",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
          SizedBox(height: 16.h),

          _buildPaymentOption(
            icon: Icons.account_balance_wallet,
            label: "KNET",
          ),
          SizedBox(height: 12.h),
          _buildPaymentOption(
            icon: Icons.credit_card,
            label: "Credit Card",
          ),

          const Spacer(),

          // Confirm Button
          Padding(
            padding: EdgeInsets.all(20.w),
            child: SizedBox(
              width: double.infinity,
              height: 56.h,
              child: ElevatedButton(
                onPressed: () {
                  widget.onPaymentChanged(localSelectedPayment);
                  Navigator.of(context).pop();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary500,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(28.r),
                  ),
                  elevation: 0,
                ),
                child: Text(
                  'Confirm',
                  style: Theme.of(context).textTheme.headlineLarge
                      ?.copyWith(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentOption({required IconData icon, required String label}) {
    final isSelected = localSelectedPayment == label;

    return GestureDetector(
      onTap: () {
        setState(() {
          localSelectedPayment = label;
        });
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.w),
        padding: EdgeInsets.all(16.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color: isSelected ? AppColors.primary500 : Colors.grey[300]!,
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Row(
          children: [
            Icon(icon, color: AppColors.primary500, size: 28.sp),
            SizedBox(width: 16.w),
            Expanded(
              child: Text(
                label,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
            Icon(Icons.arrow_forward_ios, size: 16.sp, color: Colors.black54),
          ],
        ),
      ),
    );
  }
}
