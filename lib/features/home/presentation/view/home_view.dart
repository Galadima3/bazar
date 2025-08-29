import 'package:bazar/core/routing/route_paths.dart';
import 'package:bazar/core/themes/app_colors.dart';
import 'package:bazar/features/home/presentation/widgets/authors_widget.dart';
import 'package:bazar/features/home/presentation/widgets/best_vendors_widget.dart';
import 'package:bazar/features/home/presentation/widgets/weekly_top.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomScrollView(
      slivers: [
        // AppBar (sliver-based so it integrates with scroll)
        SliverAppBar(
          floating: true,
          snap: true,

          title: const Text("Home"),
          leading: const Icon(CupertinoIcons.search),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 10.0.h),
              child: Badge(
                backgroundColor: Colors.red,
                label: const Text("3"),
                // child: const Icon(CupertinoIcons.bell),
                child: IconButton(
                  onPressed: () => context.push(RoutePaths.notifications),
                  icon: Icon(CupertinoIcons.bell),
                ),
              ),
            ),
          ],
        ),

        // Main content
        SliverToBoxAdapter(
          child: Column(
            children: [
              // Special Offers Box
              SizedBox(height: 16.h),
              const _SpecialOfferBox(),
              SizedBox(height: 27.h),

              // Top of the week
              TopOfTheWeek(),
              SizedBox(height: 32.h),

              // Best Vendors
              const BestVendors(),
              SizedBox(height: 32.h),

              // Authors
              AuthorsWidget(),
              SizedBox(height: 32.h),
            ],
          ),
        ),
      ],
    );
  }
}

class _SpecialOfferBox extends StatelessWidget {
  const _SpecialOfferBox();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 146.h,
      width: 327.w,
      decoration: BoxDecoration(
        color: AppColors.primary50,
        borderRadius: BorderRadius.circular(12),
      ),
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //Special Offer
          Expanded(
            flex: 2,
            child: Padding(
              padding: EdgeInsets.only(left: 16.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Special Offer",
                    style: Theme.of(context).textTheme.headlineMedium
                  ),
                  Text("Discount: 25%", style: Theme.of(context).textTheme.bodyMedium,),
                  SizedBox(
                    height: 14.h,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(100.w, 36.h),
                      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                    ),
                    onPressed: () {},
                    child: Text("Order Now"),
                  ),
                ],
              ),
            ),
          ),

          // Image
          Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.only(right: 8.w),
              child: Image.asset(
                "assets/images/apollo.jpg",
                fit: BoxFit.cover,
                height: double.infinity,
                width: 99,
              ),
            ),
          ),
        ],
      ),
    );
  }
}