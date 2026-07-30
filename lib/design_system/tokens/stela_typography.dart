import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract final class StelaTypography {
  static TextTheme get textTheme => GoogleFonts.montserratTextTheme().copyWith(
    displaySmall: GoogleFonts.montserrat(
      fontSize: 30,
      fontWeight: FontWeight.w700,
    ),
    headlineSmall: GoogleFonts.montserrat(
      fontSize: 24,
      fontWeight: FontWeight.w700,
    ),
    titleLarge: GoogleFonts.montserrat(
      fontSize: 20,
      fontWeight: FontWeight.w600,
    ),
    titleMedium: GoogleFonts.montserrat(
      fontSize: 16,
      fontWeight: FontWeight.w600,
    ),
    bodyMedium: GoogleFonts.montserrat(fontSize: 14),
    bodySmall: GoogleFonts.montserrat(fontSize: 12),
  );
}
