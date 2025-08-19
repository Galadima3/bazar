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
