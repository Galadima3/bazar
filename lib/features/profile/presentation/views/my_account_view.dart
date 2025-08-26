import 'package:bazar/core/themes/app_colors.dart';
import 'package:bazar/features/auth/presentation/widgets/labeled_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyAccountView extends ConsumerStatefulWidget {
  const MyAccountView({super.key});

  @override
  ConsumerState<MyAccountView> createState() => _MyAccountViewState();
}

class _MyAccountViewState extends ConsumerState<MyAccountView> {
  final nameController = TextEditingController(text: "John Doe");
  final emailController = TextEditingController(text: "JohnDoe@gmail.com");
  final phoneNumberController = TextEditingController(
    text: "+ 234 810 8134 568",
  );
  final passwordController = TextEditingController(text: "••••••••");
  bool isVisible = false;

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneNumberController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void _saveChanges() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Changes saved successfully!'),
        backgroundColor: Colors.green,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: Text(
          "My Account",
          style: TextStyle(fontSize: 18.sp),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 5.h),

              // Avatar
              Stack(
                children: [
                  CircleAvatar(
                    radius: 50.r,
                    backgroundImage: const NetworkImage(
                      'https://plus.unsplash.com/premium_photo-1755387617084-831dceee26b5?q=80&w=1170&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      height: 35.w,
                      width: 35.w,
                      decoration: const BoxDecoration(
                        color: Colors.blue,
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        icon: Icon(
                          Icons.camera_alt,
                          color: Colors.white,
                          size: 18.sp,
                        ),
                        onPressed: () {
                          // TODO: Implement image picker
                        },
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 30.h),

              // Name Field
              LabeledTextField(
                label: "Name",
                hint: "Full Name",
                controller: nameController,
              ),
              SizedBox(height: 16.h),

              // Email Field
              LabeledTextField(
                label: "Email",
                hint: "Email Address",
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 16.h),

              // Phone Field
              LabeledTextField(
                label: "Phone Number",
                hint: "Phone Number",
                controller: phoneNumberController,
                keyboardType: TextInputType.phone,
              ),
              SizedBox(height: 16.h),

              // Password Field
              LabeledTextField(
                label: "Password",
                hint: "Password",
                controller: passwordController,
                suffix: IconButton(
                  onPressed: () => setState(() {
                    isVisible = !isVisible;
                  }),
                  icon: Icon(
                    isVisible ? Icons.visibility : Icons.visibility_off,
                    size: 20.sp,
                  ),
                ),
                obscureText: !isVisible,
              ),

              SizedBox(height: 50.h),

              // Save Button
              SizedBox(
                width: double.infinity,
                height: 50.h,
                child: ElevatedButton(
                  onPressed: _saveChanges,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary500,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                  ),
                  child: Text(
                    'Save Changes',
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
    );
  }
}
