import 'package:bazar/core/themes/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LocationView extends ConsumerStatefulWidget {
  const LocationView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LocationViewState();
}

class _LocationViewState extends ConsumerState<LocationView> {
  bool _showBottomSheet = false;
  String selectedOption = "";

  void _toggleBottomSheet() {
    setState(() {
      _showBottomSheet = !_showBottomSheet;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: const Text("Location"),
      ),
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Address on Map
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Container(
                  height: 223.h,
                  width: 327.w,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
              ),
            ],
          ),

          // Persistent Bottom Sheet
          if (_showBottomSheet)
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 405.h,
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10.r,
                      offset: Offset(0, -2.h),
                    ),
                  ],
                ),
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 16.h),

                    // Header
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Detail Address',
                          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                                fontSize: 20.sp,
                              ),
                        ),
                        GestureDetector(
                          onTap: _toggleBottomSheet,
                          child: Icon(
                            Icons.location_pin,
                            color: AppColors.primary500,
                            size: 24.sp,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 24.h),

                    // Location Tile
                    ListTile(
                      leading: Container(
                        height: 40.h,
                        width: 40.w,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.grey50,
                        ),
                        child: Center(
                          child: Icon(
                            CupertinoIcons.location,
                            color: AppColors.primary500,
                            size: 20.sp,
                          ),
                        ),
                      ),
                      title: Text(
                        "Utama Street No.20",
                        style: TextStyle(fontSize: 14.sp),
                      ),
                      subtitle: Text(
                        "state Street No.15, New York 10001, United States",
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Colors.grey.shade500,
                              fontSize: 12.sp,
                            ),
                      ),
                    ),

                    SizedBox(height: 16.h),

                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Save Address As",
                        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                              fontSize: 18.sp,
                            ),
                      ),
                    ),

                    SizedBox(height: 16.h),

                    Align(
                      alignment: Alignment.centerLeft,
                      child: Wrap(
                        spacing: 8.w,
                        children: [
                          ChoiceChip(
                            label: Text("Home", style: TextStyle(fontSize: 14.sp)),
                            selected: selectedOption == "Home",
                            onSelected: (bool selected) {
                              setState(() {
                                selectedOption = selected ? "Home" : "";
                              });
                            },
                            selectedColor: Colors.blueAccent,
                          ),
                          ChoiceChip(
                            label: Text("Office", style: TextStyle(fontSize: 14.sp)),
                            selected: selectedOption == "Office",
                            onSelected: (bool selected) {
                              setState(() {
                                selectedOption = selected ? "Office" : "";
                              });
                            },
                            selectedColor: Colors.green,
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 75.h),

                    SizedBox(
                      width: double.infinity,
                      height: 50.h,
                      child: ElevatedButton(
                        onPressed: _toggleBottomSheet,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary400,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                        ),
                        child: Text(
                          'Confirmation',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),

      floatingActionButton: _showBottomSheet
          ? null
          : FloatingActionButton(
              backgroundColor: AppColors.primary400,
              onPressed: _toggleBottomSheet,
              child: Icon(Icons.location_pin, color: Colors.white, size: 24.sp),
            ),
    );
  }
}
