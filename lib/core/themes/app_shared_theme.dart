import 'package:flutter/material.dart';

class AppSharedTheme {
  // Elevated buttons
  static ElevatedButtonThemeData elevatedButton(ColorScheme scheme) {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: scheme.primary,
        foregroundColor: scheme.onPrimary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      ),
    );
  }

  // NavigationBar Theme (for NavigationBar widget)
  static NavigationBarThemeData navigationBar(ColorScheme scheme) {
    return NavigationBarThemeData(
      backgroundColor: scheme.surface,
      surfaceTintColor: scheme.surfaceTint,
      elevation: 8.0,
      height: 80,
      labelTextStyle: WidgetStateProperty.resolveWith<TextStyle>((states) {
        if (states.contains(WidgetState.selected)) {
          return TextStyle(
            color: scheme.primary, // Uses primary color for selected text
            fontSize: 12,
            fontWeight: FontWeight.w700, // Bolder for selected state
          );
        }
        return TextStyle(
          color: scheme.onSurfaceVariant.withValues(alpha: 0.7), // Slightly muted unselected
          fontSize: 12,
          fontWeight: FontWeight.w400,
        );
      }),
      iconTheme: WidgetStateProperty.resolveWith<IconThemeData>((states) {
        if (states.contains(WidgetState.selected)) {
          return IconThemeData(
            color: scheme.primary, // Uses primary color for selected icon
            size: 26, // Slightly larger for selected state
          );
        }
        return IconThemeData(
          color: scheme.onSurfaceVariant.withValues(alpha: 0.7), // Slightly muted unselected
          size: 24,
        );
      }),
      indicatorColor: scheme.primary.withValues(alpha: 0.12), // Subtle primary indicator
      indicatorShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
    );
  }

  // BottomNavigationBar Theme (for BottomNavigationBar widget)
  static BottomNavigationBarThemeData bottomNavigationBar(ColorScheme scheme) {
    return BottomNavigationBarThemeData(
      backgroundColor: scheme.surface,
      elevation: 8.0,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: scheme.primary, // Primary color for selected items
      unselectedItemColor: scheme.onSurfaceVariant.withValues(alpha: 0.7), // Muted unselected
      selectedLabelStyle: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w700, // Bolder for selected
      ),
      unselectedLabelStyle: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
      ),
      selectedIconTheme: IconThemeData(
        color: scheme.primary, // Primary color for selected icon
        size: 26, // Slightly larger for selected
      ),
      unselectedIconTheme: IconThemeData(
        color: scheme.onSurfaceVariant.withValues(alpha: 0.7), // Muted unselected
        size: 24,
      ),
      showSelectedLabels: true,
      showUnselectedLabels: true,
    );
  }

  // AppBar Theme
  static AppBarTheme appBar(ColorScheme scheme) {
    return AppBarTheme(
      backgroundColor: scheme.brightness == Brightness.light
          ? Colors.white
          : Colors.black,
      foregroundColor: scheme.brightness == Brightness.light
          ? Colors.black
          : Colors.white,
      toolbarHeight: 50,
      elevation: 0,
      centerTitle: true,
      iconTheme: IconThemeData(
        color: scheme.brightness == Brightness.light
            ? Colors.black
            : Colors.white,
      ),
      actionsIconTheme: IconThemeData(
        color: scheme.brightness == Brightness.light
            ? Colors.black
            : Colors.white,
      ),
      titleTextStyle: TextStyle(
        color: scheme.brightness == Brightness.light
            ? Colors.black
            : Colors.white,
        fontSize: 20,
        fontFamily: 'OpenSans',
        fontWeight: FontWeight.bold,
      ),
    );
  }

  // Cards
  static CardThemeData card(ColorScheme scheme) {
    return CardThemeData(
      color: scheme.surface,
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    );
  }

  // Input fields
  static InputDecorationTheme input(ColorScheme scheme) {
    return InputDecorationTheme(
      filled: true,
      fillColor: scheme.surfaceContainerHighest,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: scheme.outline),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: scheme.outline),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: scheme.primary, width: 0.5),
      ),
      labelStyle: TextStyle(color: scheme.onSurfaceVariant),
      hintStyle: TextStyle(color: scheme.onSurfaceVariant),
    );
  }

  // Switches
  static SwitchThemeData switchTheme(ColorScheme scheme) {
    return SwitchThemeData(
      thumbColor: WidgetStateProperty.resolveWith<Color>(
        (states) => states.contains(WidgetState.selected)
            ? scheme.primary
            : scheme.onSurfaceVariant,
      ),
      trackColor: WidgetStateProperty.resolveWith<Color>(
        (states) => states.contains(WidgetState.selected)
            ? scheme.primary.withValues(alpha: 0.5)
            : scheme.surfaceContainerHighest,
      ),
    );
  }

  // Checkboxes
  static CheckboxThemeData checkbox(ColorScheme scheme) {
    return CheckboxThemeData(
      fillColor: WidgetStateProperty.resolveWith<Color>(
        (states) => states.contains(WidgetState.selected)
            ? scheme.primary
            : scheme.onSurfaceVariant,
      ),
      checkColor: WidgetStateProperty.all<Color>(scheme.onPrimary),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    );
  }
}