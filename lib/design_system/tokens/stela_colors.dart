import 'package:flutter/material.dart';

abstract final class StelaColors {
  static const primaryRed = Color(0xFFAE0002);
  static const darkRed = Color(0xFF740001);
  static const primaryGold = Color(0xFFEFBA31);
  static const deepGold = Color(0xFFD4A724);
  static const textPrimary = Color(0xFF181818);
  static const textSecondary = Color(0xFF686868);
  static const warmBackground = Color(0xFFF7F6F2);
  static const surface = Color(0xFFFFFFFF);
  static const border = Color(0xFFE2E0D9);
  static const success = Color(0xFF218A52);
  static const warning = Color(0xFFC47A00);
  static const danger = Color(0xFFB42318);

  static const lightScheme = ColorScheme.light(
    primary: primaryRed,
    onPrimary: Colors.white,
    secondary: primaryGold,
    onSecondary: textPrimary,
    surface: surface,
    onSurface: textPrimary,
    outline: border,
    error: danger,
  );
}
