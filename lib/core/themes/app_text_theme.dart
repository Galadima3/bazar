import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextTheme {
  static TextTheme textTheme(ColorScheme scheme) {
    return TextTheme(
      // H1
      displayLarge: TextStyle(fontSize: 40.sp, fontFamily: 'OpenSans', color: scheme.onSurface),
      // H2
      displayMedium: TextStyle(fontSize: 32.sp, fontFamily: 'OpenSans', color: scheme.onSurface),
      // H3
      displaySmall: TextStyle(fontSize: 24.sp, fontFamily: 'OpenSans', color: scheme.onSurface),
      // H4
      headlineLarge: TextStyle(fontSize: 20.sp, fontFamily: 'OpenSans', color: scheme.onSurface),
      // H5
      headlineMedium: TextStyle(fontSize: 18.sp, fontFamily: 'OpenSans', color: scheme.onSurface),
      //H6
      headlineSmall: TextStyle(fontSize: 16.sp, fontFamily: 'OpenSans', color: scheme.onSurface),
      bodyLarge: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w400, height: 1.5.h, fontFamily: 'Roboto', color: scheme.onSurface),
      bodyMedium: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400, height: 1.5.h, fontFamily: 'Roboto', color: scheme.onSurface),
      bodySmall: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w400, height: 1.5.h, fontFamily: 'Roboto', color: scheme.onSurface),
      labelLarge: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600, fontFamily: 'Roboto', color: scheme.onPrimary),
      labelMedium: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w500, fontFamily: 'Roboto', color: scheme.onSurface),
      labelSmall: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w400, fontFamily: 'Roboto', color: scheme.onSurface),
    );
  }
}
