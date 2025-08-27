import 'package:bazar/core/themes/app_colors.dart';
import 'package:bazar/features/home/presentation/view/notification_detail_view.dart';
import 'package:bazar/features/home/presentation/widgets/notification_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationsView extends StatelessWidget {
  const NotificationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black, size: 24.sp),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Notification',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        children: [
          SizedBox(height: 20.h),

          // October 2021 Section
          Text(
            'October 2021',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          SizedBox(height: 16.h),

          // Promotion Notification 1
          NotificationTile(
            type: 'Promotion',
            typeColor: AppColors.primary500,
            title:
                'Today 50% discount on all Books in Novel category with online orders worldwide.',
            date: 'Oct 21',
            time: '08:00',

            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const NotificationDetailView(),
              ),
            ),
          ),

          SizedBox(height: 16.h),

          // Promotion Notification 2
          NotificationTile(
            type: 'Promotion',
            typeColor: AppColors.primary500,
            title:
                'Buy 2 get 1 free for since books from 08 - 10 October 2021.',
            date: 'Oct 08',
            time: '20:30',
            onTap: () {},
          ),

          SizedBox(height: 32.h),

          // September 2021 Section
          Text(
            'September 2021',
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 16.h),

          // Information Notification
          NotificationTile(
            type: 'Information',
            typeColor: const Color(0xFF3B82F6),
            title: 'There is a new book now are available',
            date: 'Sept 16',
            time: '11:00',
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

