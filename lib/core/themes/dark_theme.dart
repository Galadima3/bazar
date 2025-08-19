// import 'package:flutter/material.dart';

// class DarkTheme {
//   static ThemeData getTheme(ColorScheme colorScheme) {
//     return ThemeData(
//       useMaterial3: true,
//       colorScheme: colorScheme,
//       scaffoldBackgroundColor: colorScheme.surface,
//       appBarTheme: AppBarTheme(
//         backgroundColor: colorScheme.surface,
//         foregroundColor: colorScheme.onSurface,
//       ),
//       elevatedButtonTheme: ElevatedButtonThemeData(
//         style: ElevatedButton.styleFrom(
//           backgroundColor: colorScheme.primary,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(16),
//           ),
//         ),
//       ),
//       cardTheme: CardThemeData(
//         color: colorScheme.surface,
//         elevation: 4,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(12),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:bazar/core/themes/app_text_theme.dart';
import 'package:bazar/core/themes/app_shared_theme.dart';

class DarkTheme {
  static ThemeData build(ColorScheme scheme) {
    return ThemeData(
      useMaterial3: true,
      colorScheme: scheme,
      scaffoldBackgroundColor: scheme.surface,
      appBarTheme: AppBarTheme(
        backgroundColor: scheme.surface,
        foregroundColor: scheme.onSurface,
      ),
      textTheme: AppTextTheme.textTheme(scheme),
      elevatedButtonTheme: AppSharedTheme.elevatedButton(scheme),
      cardTheme: AppSharedTheme.card(scheme),
      inputDecorationTheme: AppSharedTheme.input(scheme),
      switchTheme: AppSharedTheme.switchTheme(scheme),
      checkboxTheme: AppSharedTheme.checkbox(scheme),
    );
  }
}
