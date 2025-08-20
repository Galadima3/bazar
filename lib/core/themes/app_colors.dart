// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class AppColors {
  // ===== Greyscale =====
  static const Color grey50 = Color(0xFFFAFAFA);
  static const Color grey100 = Color(0xFFF5F5F5);
  static const Color grey200 = Color(0xFFE8E8E8);
  static const Color grey300 = Color(0xFFD6D6D6);
  static const Color grey400 = Color(0xFFB8B8B8);
  static const Color grey500 = Color(0xFFA6A6A6);
  static const Color grey600 = Color(0xFF7A7A7A);
  static const Color grey700 = Color(0xFF454545);
  static const Color grey800 = Color(0xFF292929);
  static const Color grey900 = Color(0xFF121212);

  // ===== Primary =====
  static const Color primary50 = Color(0xFFFAF9FD);
  static const Color primary100 = Color(0xFFE5DEF8);
  static const Color primary200 = Color(0xFFCABCEF);
  static const Color primary300 = Color(0xFFA28CE0);
  static const Color primary400 = Color(0xFF7D64C3);
  static const Color primary500 = Color(0xFF54408C);
  static const Color primary600 = Color(0xFF352368);
  static const Color primary700 = Color(0xFF251554);
  static const Color primary800 = Color(0xFF10052F);
  static const Color primary900 = Color(0xFF09031B);

  // ===== Additional =====
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color yellow = Color(0xFFFBAE05);
  static const Color orange = Color(0xFFFF8C39);
  static const Color red = Color(0xFFEFA5A6);
  static const Color blue = Color(0xFF3784FB);

    // ===== Material ColorScheme =====
  static final ColorScheme lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: primary500,
    onPrimary: white,
    primaryContainer: primary100,
    onPrimaryContainer: primary900,
    secondary: blue,
    onSecondary: white,
    secondaryContainer: blue,
    onSecondaryContainer: white,
    tertiary: orange,
    onTertiary: white,
    tertiaryContainer: orange,
    onTertiaryContainer: white,
    error: red,
    onError: white,
    errorContainer: red,
    onErrorContainer: white,
    background: grey50,
    onBackground: grey900,
    surface: white,
    onSurface: grey900,
    surfaceVariant: grey200,
    onSurfaceVariant: grey700,
    outline: grey400,
    shadow: grey900,
    inverseSurface: grey900,
    onInverseSurface: white,
    inversePrimary: primary200,
    scrim: black,
  );

  static final ColorScheme darkColorScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: primary200,
    onPrimary: black,
    primaryContainer: primary700,
    onPrimaryContainer: white,
    secondary: blue,
    onSecondary: black,
    secondaryContainer: blue,
    onSecondaryContainer: white,
    tertiary: orange,
    onTertiary: black,
    tertiaryContainer: orange,
    onTertiaryContainer: white,
    error: red,
    onError: black,
    errorContainer: red,
    onErrorContainer: white,
    background: grey900,
    onBackground: grey50,
    surface: grey800,
    onSurface: grey50,
    surfaceVariant: grey700,
    onSurfaceVariant: grey200,
    outline: grey400,
    shadow: black,
    inverseSurface: grey50,
    onInverseSurface: grey900,
    inversePrimary: primary400,
    scrim: black,
  );
}
