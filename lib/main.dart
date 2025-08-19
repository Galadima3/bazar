import 'package:bazar/core/themes/app_theme.dart';
import 'package:bazar/features/home/home_screen.dart';
import 'package:bazar/features/onboarding/service/onboarding_service.dart';
import 'package:bazar/features/onboarding/view/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//TODO: Finish Custom Theme Integration
//TODO: Complete Auth Feature
//TODO: Switch to GoRouter

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool? hasSeenOnboarding;
  @override
  void initState() {
    super.initState();
    _init();
  }

  Future<void> _init() async {
    final seen = await OnboardingService.hasSeenOnboarding();
    setState(() => hasSeenOnboarding = seen);
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,

      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.system,

      home: hasSeenOnboarding == null
          ? const SizedBox.shrink() // still waiting
          : (hasSeenOnboarding!
                ? const HomeScreen()
                : const OnboardingScreen()),
    );
  }
}
