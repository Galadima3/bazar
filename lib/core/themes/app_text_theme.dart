import 'package:flutter/material.dart';

class AppTextTheme {
  static TextTheme textTheme(ColorScheme scheme) {
    return TextTheme(
      // H1
      displayLarge: TextStyle(
        fontSize: 40,
        fontFamily: 'OpenSans',
        color: scheme.onSurface,
      ),
      // H2
      displayMedium: TextStyle(
        fontSize: 32,
        fontFamily: 'OpenSans',
        color: scheme.onSurface,
      ),
      // H3
      displaySmall: TextStyle(
        fontSize: 24,
        fontFamily: 'OpenSans',
        color: scheme.onSurface,
      ),
      // H4
      headlineLarge: TextStyle(
        fontSize: 20,
        fontFamily: 'OpenSans',
        color: scheme.onSurface,
      ),
      // H5
      headlineMedium: TextStyle(
        fontSize: 18,
        fontFamily: 'OpenSans',
        color: scheme.onSurface,
      ),
      //H6
      headlineSmall: TextStyle(
        fontSize: 16,
        fontFamily: 'OpenSans',
        color: scheme.onSurface,
      ),
      bodyLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        height: 1.5,
        fontFamily: 'Roboto',
        color: scheme.onSurface,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        height: 1.5,
        fontFamily: 'Roboto',
        color: scheme.onSurface,
      ),
      bodySmall: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        height: 1.5,
        fontFamily: 'Roboto',
        color: scheme.onSurface,
      ),
      labelLarge: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        fontFamily: 'Roboto',
        color: scheme.onPrimary,
      ),
      labelMedium: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        fontFamily: 'Roboto',
        color: scheme.onSurface,
      ),
      labelSmall: TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.w400,
        fontFamily: 'Roboto',
        color: scheme.onSurface,
      ),
    );
  }
}
