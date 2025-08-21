import 'package:bazar/core/themes/app_colors.dart';
import 'package:bazar/core/themes/dark_theme.dart';
import 'package:bazar/core/themes/light_theme.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData light = LightTheme.build(AppColors.lightColorScheme);
  static ThemeData dark = DarkTheme.build(AppColors.darkColorScheme);
}
