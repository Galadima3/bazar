import 'package:bazar/core/themes/app_colors.dart';
import 'package:bazar/features/profile/presentation/widgets/coupon_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Example Provider (if you want to store coupons in Riverpod)
final couponsProvider = Provider<List<Map<String, dynamic>>>((ref) {
  return [
    {"discount": "50%", "color": AppColors.primary500},
    {"discount": "23%", "color": Colors.amber},
    {"discount": "50%", "color": Colors.blue},
    {"discount": "23%", "color": AppColors.orange},
    {"discount": "50%", "color": Colors.black},
    {"discount": "23%", "color": Colors.green},
  ];
});

class OffersPromoView extends ConsumerStatefulWidget {
  const OffersPromoView({super.key});

  @override
  ConsumerState<OffersPromoView> createState() => _OffersPromoViewState();
}

class _OffersPromoViewState extends ConsumerState<OffersPromoView> {
  @override
  Widget build(BuildContext context) {
    final coupons = ref.watch(couponsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Order History"),
        centerTitle: true,
        leading: BackButton()
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "You Have ${coupons.length} Coupons to use",
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: GridView.builder(
                itemCount: coupons.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 1,
                ),
                itemBuilder: (context, index) {
                  final coupon = coupons[index];
                  return CouponCard(
                    discount: coupon["discount"]!,
                    color: coupon["color"] as Color,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

