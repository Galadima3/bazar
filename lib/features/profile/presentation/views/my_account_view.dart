import 'package:bazar/core/themes/app_colors.dart';
import 'package:bazar/features/auth/presentation/widgets/labeled_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyAccountView extends ConsumerStatefulWidget {
  const MyAccountView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyAccountViewState();
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
    // TODO: Implement save functionality
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
        title: const Text("My Account"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Circle Avatar
              const SizedBox(height: 5),
              Stack(
                children: [
                  const CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(
                      'https://plus.unsplash.com/premium_photo-1755387617084-831dceee26b5?q=80&w=1170&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                    ), // Add your default avatar asset
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      height: 35,
                      width: 35,
                      decoration: const BoxDecoration(
                        color: Colors.blue,
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        icon: const Icon(
                          Icons.camera_alt,
                          color: Colors.white,
                          size: 18,
                        ),
                        onPressed: () {
                          // TODO: Implement image picker
                        },
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),

              // Name Text Field
              LabeledTextField(
                label: "Name",
                hint: "Full Name",
                controller: nameController,
              ),
              const SizedBox(height: 16),

              // Email Text Field
              LabeledTextField(
                label: "Email",
                hint: "Email Address",
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16),

              // Phone Number Text Field
              LabeledTextField(
                label: "Phone Number",
                hint: "Phone Number",
                controller: phoneNumberController,
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(height: 16),

              // Password Text Field
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
                  ),
                ),
                obscureText: true,
              ),

              const SizedBox(height: 50),

              // Save Changes Button
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: _saveChanges,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary500,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: const Text(
                    'Save Changes',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
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
