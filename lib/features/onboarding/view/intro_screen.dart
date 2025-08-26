// import 'package:bazar/core/routing/route_paths.dart';
// import 'package:bazar/features/onboarding/service/onboarding_service.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:go_router/go_router.dart';

// class IntroScreen extends StatelessWidget {
//   final String text;
//   final String subtext;
//   final String imagePath;

//   const IntroScreen({
//     super.key,
//     required this.text,
//     required this.subtext,
//     required this.imagePath,
//   });

//   @override
//   Widget build(BuildContext context) {

//     final screenHeight = MediaQuery.of(context).size.height;
//      final isLargeScreen = screenHeight > 800;
//     final textTheme = Theme.of(context).textTheme;
//     return SingleChildScrollView(
//       child: Padding(
//         padding:  EdgeInsets.symmetric(horizontal: 24.h),
//         child: Column(
//           children: [
//              SizedBox(height: 90.h),

//             Image.asset(imagePath, height: 280.h, fit: BoxFit.contain),

//             SizedBox(height: 14.h),
//             Text(
//               text,
//               style: textTheme.headlineMedium?.copyWith(fontSize: 20.sp),
//               textAlign: TextAlign.center,
//             ),

//             SizedBox(height: 12.h),

//             Text(
//               subtext,
//               style: textTheme.bodyLarge?.copyWith(
//                 fontSize: 15.sp,
//                 color: Colors.grey,
//               ),
//               textAlign: TextAlign.center,
//             ),

//             SizedBox(height: 68.h),
//             // Continue Button
//             SizedBox(
//               width: 327.w,
//               height: 56.h,
//               child: ElevatedButton(
//                 onPressed: () async {
//                   await OnboardingService.setOnboardingSeen();
//                   if (!context.mounted) return;
//                   context.pushReplacement(RoutePaths.signup);
//                 },
//                 child: Text(
//                   "Get Started",
//                   style: textTheme.headlineSmall?.copyWith(color: Colors.white),
//                 ),
//               ),
//             ),

//             SizedBox(height: 12.h),

//             // Sign In Button
//             SizedBox(
//               width: 327.w,
//               height: 56.h,
//               child: OutlinedButton(
//                 onPressed: () => context.push(RoutePaths.login),
//                 style: OutlinedButton.styleFrom(
//                   side: const BorderSide(color: Color(0xff564290)),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(12.r),
//                   ),
//                 ),
//                 child: Text(
//                   "Sign in",
//                   style: textTheme.headlineSmall?.copyWith(
//                     color: Color(0xff564290),
//                   ),
//                 ),
//               ),
//             ),

//             SizedBox(height: 40.h),
//           ],
//         ),
//       ),
//     );
//   }
// }


import 'package:bazar/core/routing/route_paths.dart';
import 'package:bazar/features/onboarding/service/onboarding_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IntroScreen extends StatelessWidget {
  final String text;
  final String subtext;
  final String imagePath;
  final PageController controller; 
  final int count; 

  const IntroScreen({
    super.key,
    required this.text,
    required this.subtext,
    required this.imagePath,
    required this.controller,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          children: [
            SizedBox(height: 90.h),

            Image.asset(imagePath, height: 280.h, fit: BoxFit.contain),

            SizedBox(height: 14.h),

            Text(
              text,
              style: textTheme.headlineMedium?.copyWith(fontSize: 20.sp),
              textAlign: TextAlign.center,
            ),

            SizedBox(height: 12.h),

            Text(
              subtext,
              style: textTheme.bodyLarge?.copyWith(
                fontSize: 15.sp,
                color: Colors.grey,
              ),
              textAlign: TextAlign.center,
            ),

            SizedBox(height: 68.h),

            // Get Started button
            SizedBox(
              width: 327.w,
              height: 56.h,
              child: ElevatedButton(
                onPressed: () async {
                  await OnboardingService.setOnboardingSeen();
                  if (!context.mounted) return;
                  context.go(RoutePaths.signup);
                },
                child: Text(
                  "Get Started",
                  style: textTheme.headlineSmall?.copyWith(color: Colors.white),
                ),
              ),
            ),

            SizedBox(height: 10.h),

            // 👇 Dot Indicators now in between buttons
            SmoothPageIndicator(
              controller: controller,
              count: count,
              effect: SlideEffect(
                radius: 5.r,
                dotWidth: 7.5.w,
                dotHeight: 7.5.h,
                spacing: 5.w,
                activeDotColor: const Color(0xff564290),
              ),
            ),

            SizedBox(height: 10.h),

            // Sign In button
            SizedBox(
              width: 327.w,
              height: 56.h,
              child: OutlinedButton(
                onPressed: () => context.go(RoutePaths.login),
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Color(0xff564290)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
                child: Text(
                  "Sign in",
                  style: textTheme.headlineSmall?.copyWith(
                    color: const Color(0xff564290),
                  ),
                ),
              ),
            ),

            SizedBox(height: 40.h),
          ],
        ),
      ),
    );
  }
}
