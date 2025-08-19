import 'package:bazar/core/routing/app_router.dart';
import 'package:bazar/core/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  final router = await AppRouter.create();

  runApp(ProviderScope(child: MyApp(router: router)));
}

class MyApp extends StatefulWidget {
  final GoRouter router;
  const MyApp({super.key, required this.router});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // @override
  // void initState() {
  //   super.initState();
  //   _removeSplash();
  // }

  // Future<void> _removeSplash() async {
  //   // give router time to run redirect before removing splash
  //   await Future.delayed(const Duration(milliseconds: 300));
  //   FlutterNativeSplash.remove();
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.system,
      //routerConfig: AppRouter.router,
      routerConfig: widget.router,
    );
  }
}
