import 'package:flutter/material.dart';
import 'package:bazar/core/themes/app_text_theme.dart';
import 'package:bazar/core/themes/app_shared_theme.dart';
import 'package:bazar/core/themes/app_colors.dart';

class LightTheme {
  static ThemeData build(ColorScheme scheme) {
    return ThemeData(
      useMaterial3: true,
      colorScheme: scheme,
      scaffoldBackgroundColor: AppColors.white,
      appBarTheme: AppSharedTheme.appBar(scheme),
      textTheme: AppTextTheme.textTheme(scheme),
      // navigationBarTheme: AppSharedTheme.navigationBar(scheme),
      bottomNavigationBarTheme: AppSharedTheme.bottomNavigationBar(scheme),
      listTileTheme: AppSharedTheme.listTile(scheme),
      elevatedButtonTheme: AppSharedTheme.elevatedButton(scheme),
      cardTheme: AppSharedTheme.card(scheme),
      inputDecorationTheme: AppSharedTheme.input(scheme),
      switchTheme: AppSharedTheme.switchTheme(scheme),
      checkboxTheme: AppSharedTheme.checkbox(scheme),
    );
  }
}
