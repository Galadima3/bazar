import 'package:bazar/core/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationDetailView extends StatelessWidget {
  const NotificationDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: BackButton(),
        title: Text('Promotion'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20.h),

            // Promotion Header with Image
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                color: Colors.grey[50],
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '50% Discount\nOn All Desert',
                              style: Theme.of(context).textTheme.headlineLarge
                                  ?.copyWith(color: AppColors.primary500),
                            ),
                            SizedBox(height: 8.h),
                            Text(
                              'Grab it now!',
                              style: Theme.of(context).textTheme.bodyMedium
                                  ?.copyWith(color: AppColors.primary500),
                            ),
                            SizedBox(height: 12.5.h),
                            SizedBox(
                              width: 120.w,
                              height: 40.h,
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.primary500,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.r),
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    'Order Now',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(
                                          fontSize: 13.75,
                                          color: AppColors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 12.w),
                      Expanded(
                        flex: 2,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.r),
                          child: Container(
                            height: 120.h,
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [Color(0xFF4338CA), Color(0xFF7C3AED)],
                              ),
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            child: Center(
                              child: Text(
                                'The Little Prince',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: 24.h),

            // Main Title
            Text(
              'Today 50% discount on all products in Chapter with online orders',
              style: Theme.of(
                context,
              ).textTheme.headlineMedium?.copyWith(color: AppColors.grey800),
            ),

            SizedBox(height: 16.h),

            // Description
            Text(
              'Excuse me... Who could ever resist a discount feast? 👑',
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(color: AppColors.grey600),
            ),

            SizedBox(height: 12.h),

            Text(
              'Hear me out. Today, October 21, 2021, Chapter has a 50% discount for any product. What are you waiting for, let\'s order now before it runs out.',
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(color: AppColors.grey600),
            ),

            SizedBox(height: 12.h),

            Text(
              'All of the products are discounted, just order through the Chapter app to enjoy this discount. From the best to the best we have prepared for you, may you always be happy when ordering at Chapter. Please choose the best product you want.',
              style: Theme.of(context).textTheme.bodyMedium
                                  ?.copyWith(color: AppColors.grey600),
            ),

            SizedBox(height: 12.h),

            RichText(
              text: TextSpan(
                style: Theme.of(context).textTheme.bodyMedium
                                  ?.copyWith(color: AppColors.grey600),
                children: [
                  const TextSpan(
                    text:
                        'So, what\'s your call? Let\'s roll, order your comfort book now ',
                  ),
                  TextSpan(
                    text: '🤠',
                    style: TextStyle(fontSize: 14.sp),
                  ),
                ],
              ),
            ),

            SizedBox(height: 40.h),
          ],
        ),
      ),
    );
  }
}
