// import 'package:bazar/core/themes/app_colors.dart';
// import 'package:flutter/material.dart';
// import 'light_theme.dart';
// import 'dark_theme.dart';

// class AppTheme {
//   // static const seed = Color(0xff564290);

//   // static final lightColorScheme = ColorScheme.fromSeed(
//   //   seedColor: seed,
//   //   brightness: Brightness.light,
//   // );

//   // static final darkColorScheme = ColorScheme.fromSeed(
//   //   seedColor: seed,
//   //   brightness: Brightness.dark,
//   // );

//   static final lightTheme = LightTheme.getTheme(AppColors.lightColorScheme);
//   static final darkTheme = DarkTheme.getTheme(AppColors.darkColorScheme);
// }

import 'package:bazar/core/themes/app_colors.dart';
import 'package:bazar/core/themes/dark_theme.dart';
import 'package:bazar/core/themes/light_theme.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData light = LightTheme.build(AppColors.lightColorScheme);
  static ThemeData dark = DarkTheme.build(AppColors.darkColorScheme);
}
