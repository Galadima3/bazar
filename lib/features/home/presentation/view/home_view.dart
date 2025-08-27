import 'package:bazar/core/routing/route_paths.dart';
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
                child: IconButton(onPressed: () => context.push(RoutePaths.notifications), icon: Icon(CupertinoIcons.bell)),
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
      height: 150.h,
      width: 327.w,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(12),
      ),
      alignment: Alignment.center,
      child:  Text(
        "Special Offer",
        style: TextStyle(color: Colors.white, fontSize: 18.sp),
      ),
    );
  }
}
