import 'package:bazar/core/themes/app_colors.dart';
import 'package:bazar/features/cart/presentation/widgets/address_box.dart';
import 'package:bazar/features/cart/presentation/widgets/confirm_order_tile.dart';
import 'package:bazar/features/home/models/book.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ConfirmOrderView extends ConsumerWidget {
  final List<Book> orders;
  const ConfirmOrderView({super.key, required this.orders});

  double get totalPrice {
    return orders.fold(0.0, (sum, book) {
      final priceString = book.price.replaceAll('\$', '');
      return sum + (double.tryParse(priceString) ?? 0.0);
    });
  }

  double get shippingCost => 2.0;

  double get totalPayment => totalPrice + shippingCost;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        title: const Text('Confirm Order'),

        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Address Section
                  Text('Address', style: textTheme.headlineMedium),
                  SizedBox(height: 16.h),
                  AddressBox(),
                  SizedBox(height: 12.h),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Change',
                      style: textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.w500,
                        color: AppColors.primary500,
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),

                  // Summary Section
                  Text('Summary', style: textTheme.headlineMedium),
                  SizedBox(height: 16.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Price',
                        style: textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        '\$${totalPrice.toStringAsFixed(2)}',
                        style: textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Shipping',
                        style: textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        '\$${shippingCost.toStringAsFixed(2)}',
                        style: textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.h),
                  const Divider(color: Color(0xFFE5E5E5)),
                  SizedBox(height: 16.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Total Payment', style: textTheme.headlineSmall),
                      Text(
                        '\$${totalPayment.toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'See details',
                              style: textTheme.bodyMedium?.copyWith(
                                color: AppColors.primary500,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(width: 4),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 14,
                              color: AppColors.primary500,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 32.h),

                  // Date and Time Section
                  Text('Date and time', style: textTheme.headlineSmall),
                  SizedBox(height: 16.h),
                  ConfirmOrderTile(
                    title: 'Date & time',
                    subtitle: 'Choose date and time',
                    icon: CupertinoIcons.calendar,
                    onPressed: () {},
                  ),
                  SizedBox(height: 16.h),

                  // Payment Section
                  Text('Payment', style: textTheme.headlineSmall),
                  SizedBox(height: 16.h),
                  ConfirmOrderTile(
                    title: "Payment",
                    subtitle: "Choose your payment",
                    icon: CupertinoIcons.creditcard_fill,
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),

          // Order Button
          Container(
            padding: const EdgeInsets.all(20),
            child: SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: orders.isEmpty
                    ? null
                    : () {
                        // Handle order action
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Order confirmed! ${orders.length} books',
                            ),
                            backgroundColor: const Color(0xFF6B46C1),
                          ),
                        );
                      },
                
                child: const Text(
                  'Order',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

