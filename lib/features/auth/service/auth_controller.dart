import 'package:bazar/features/auth/presentation/view/auth/login_view.dart';
import 'package:bazar/features/auth/service/auth_service.dart';
import 'package:bazar/features/home/presentation/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

class AuthController extends StatefulWidget {
  const AuthController({super.key});

  @override
  State<AuthController> createState() => _AuthControllerState();
}

class _AuthControllerState extends State<AuthController> {
  bool? isLoggedIn;
  @override
  void initState() {
    
    super.initState();
    FlutterNativeSplash.remove();
    getUserAuth();
  }

  Future<void> getUserAuth() async {
    bool response = await AuthService.checkUserAuthStatus();
    setState(() {
      isLoggedIn = response;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isLoggedIn == null) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }
    return isLoggedIn! ? HomeScreen() : LoginView();
  }
}
