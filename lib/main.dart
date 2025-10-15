import 'package:bazar/core/routing/app_router.dart';
import 'package:bazar/core/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

// SharedPref Provider
final sharedPrefProvider = Provider<SharedPreferences>(
  (ref) => throw UnimplementedError(),
);

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  final sharedPreferences = await SharedPreferences.getInstance();

  FlutterNativeSplash.remove();
  runApp(
    ProviderScope(
      overrides: [sharedPrefProvider.overrideWithValue(sharedPreferences)],
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: false,
      builder: (context, child) {
        return MaterialApp.router(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.light,
          darkTheme: AppTheme.dark,
          themeMode: ThemeMode.system,
          routerConfig: router,
        );
      },
    );
  }
}
