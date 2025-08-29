import 'package:bazar/core/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DeliveryOptionsModal extends StatefulWidget {
  final String selectedDate;
  final String selectedTime;
  final Function(String) onDateChanged;
  final Function(String) onTimeChanged;

  const DeliveryOptionsModal({
    super.key,
    required this.selectedDate,
    required this.selectedTime,
    required this.onDateChanged,
    required this.onTimeChanged,
  });

  @override
  // ignore: library_private_types_in_public_api
  _DeliveryOptionsModalState createState() => _DeliveryOptionsModalState();
}

class _DeliveryOptionsModalState extends State<DeliveryOptionsModal> {
  late String localSelectedDate;
  late String localSelectedTime;

  @override
  void initState() {
    super.initState();
    localSelectedDate = widget.selectedDate;
    localSelectedTime = widget.selectedTime;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.5.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24.r),
          topRight: Radius.circular(24.r),
        ),
      ),
      child: Column(
        children: [
          // Handle bar
          Container(
            margin: EdgeInsets.only(top: 12),
            width: 60.w,
            height: 4.h,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(2.r),
            ),
          ),

          Expanded(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 8.h),

                  // Delivery Date
                  Text(
                    'Delivery date',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  SizedBox(height: 16.h),
                  Row(
                    children: [
                      _buildDateOption('Today', '12 Jan'),
                      SizedBox(width: 12),
                      _buildDateOption('Tomorrow', '12 Jan'),
                      SizedBox(width: 12),
                      _buildDateOption('Pick', 'a date'),
                    ],
                  ),

                  SizedBox(height: 32.h),

                  // Delivery Time
                  Text(
                    'Delivery time',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  SizedBox(height: 16.h),
                  Row(
                    children: [
                      _buildTimeOption('Between\n10AM : 11AM'),
                      SizedBox(width: 12),
                      _buildTimeOption('Between\n1PM : 3PM'),
                    ],
                  ),

                  Spacer(),

                  // Confirm Button
                  SizedBox(
                    width: double.infinity,
                    height: 56.h,
                    child: ElevatedButton(
                      onPressed: () {
                        widget.onDateChanged(localSelectedDate);
                        widget.onTimeChanged(localSelectedTime);
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

                  SizedBox(height: 16.h),

                  // Bottom indicator
                  Center(
                    child: Container(
                      width: 60.w,
                      height: 4.h,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(2.r),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDateOption(String title, String subtitle) {
    bool isSelected = localSelectedDate == title;

    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            localSelectedDate = title;
          });
        },
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 12.w),
          decoration: BoxDecoration(
            color: isSelected
                ? AppColors.primary500.withValues(alpha: 0.1)
                : Colors.grey[50],
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(
              color: isSelected ? AppColors.primary500 : Colors.grey[200]!,
            ),
          ),
          child: Column(
            children: [
              Text(title, style: Theme.of(context).textTheme.headlineSmall),
              SizedBox(height: 4.h),
              Text(subtitle, style: Theme.of(context).textTheme.headlineSmall),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTimeOption(String timeText) {
    bool isSelected = localSelectedTime == timeText;

    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            localSelectedTime = timeText;
          });
        },
        child: Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: isSelected
                ? AppColors.primary500.withValues(alpha: 0.1)
                : Colors.grey[50],
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(
              color: isSelected ? AppColors.primary500 : Colors.grey[200]!,
              width: isSelected ? 2 : 1,
            ),
          ),
          child: Text(
            timeText,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineSmall
          ),
        ),
      ),
    );
  }
}
