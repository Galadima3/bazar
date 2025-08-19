// import 'package:bazar/core/themes/app_colors.dart';
// import 'package:flutter/material.dart';

// class LightTheme {
//   static ThemeData getTheme(ColorScheme colorScheme) {
//     return ThemeData(
//       useMaterial3: true,
//       colorScheme: colorScheme,
//       scaffoldBackgroundColor: Colors.white,
//       appBarTheme: AppBarTheme(
//         backgroundColor: Colors.white,
//         foregroundColor: colorScheme.onPrimary,
//       ),
//       elevatedButtonTheme: ElevatedButtonThemeData(
//         style: ElevatedButton.styleFrom(
//           backgroundColor: AppColors.primary500,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(16),
//           ),
//         ),
//       ),
//       textTheme: const TextTheme(
//         // H1
//         displayLarge: TextStyle(fontSize: 40.0, fontFamily: 'OpenSans'),
//         // H2
//         displayMedium: TextStyle(fontSize: 32.0, fontFamily: 'OpenSans'),
//         // H3
//         displaySmall: TextStyle(fontSize: 24.0, fontFamily: 'OpenSans'),
//         // H4
//         headlineLarge: TextStyle(fontSize: 20.0, fontFamily: 'OpenSans'),
//         // H5
//         headlineMedium: TextStyle(fontSize: 18.0, fontFamily: 'OpenSans'),
//         // H6
//         headlineSmall: TextStyle(fontSize: 16.0, fontFamily: 'OpenSans'),

//         // Body Large (16px default Regular)
//         bodyLarge: TextStyle(
//           fontSize: 16,
//           fontWeight: FontWeight.w400,
//           height: 1.5,
//           fontFamily: 'Roboto',
//         ),

//         // Body Medium (14px default Regular)
//         bodyMedium: TextStyle(
//           fontSize: 14,
//           fontWeight: FontWeight.w400,
//           height: 1.5,
//           fontFamily: 'Roboto',
//         ),

//         // Body Small (12px default Regular)
//         bodySmall: TextStyle(
//           fontSize: 12,
//           fontWeight: FontWeight.w400,
//           height: 1.5,
//           fontFamily: 'Roboto',
//         ),
//       ),
//     );
//   }
// }

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
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.white,
        foregroundColor: scheme.onPrimary,
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
