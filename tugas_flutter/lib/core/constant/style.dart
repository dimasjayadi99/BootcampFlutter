import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tugas_flutter/core/constant/color.dart';

class StyleConst {
  StyleConst._();

  static var myTextTheme = TextTheme(
    displayLarge: GoogleFonts.arimo(
        fontSize: 97,
        fontWeight: FontWeight.w300,
        letterSpacing: -1.5,
        color: const Color(blackColor)),
    displayMedium: GoogleFonts.arimo(
        fontSize: 61,
        fontWeight: FontWeight.w300,
        letterSpacing: -0.5,
        color: const Color(blackColor)),
    displaySmall: GoogleFonts.arimo(
        fontSize: 48,
        fontWeight: FontWeight.w400,
        color: const Color(blackColor)),
    headlineLarge: GoogleFonts.arimo(
        fontSize: 34,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.25,
        color: const Color(blackColor)),
    headlineMedium: GoogleFonts.arimo(
        fontSize: 21,
        fontWeight: FontWeight.w700,
        color: const Color(blackColor)),
    headlineSmall: GoogleFonts.roboto(
        fontSize: 15,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.15,
        color: const Color(blackColor)),
    titleLarge: GoogleFonts.arimo(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.15,
        color: const Color(blackColor)),
    titleMedium: GoogleFonts.arimo(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.1,
        color: const Color(blackColor)),
    bodyLarge: GoogleFonts.arimo(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.5,
        color: const Color(blackColor)),
    bodyMedium: GoogleFonts.arimo(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.25,
        color: const Color(blackColor)),
    labelMedium: GoogleFonts.arimo(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.4,
        color: const Color(blackColor)),
    labelSmall: GoogleFonts.arimo(
        fontSize: 10,
        fontWeight: FontWeight.w400,
        letterSpacing: 1.5,
        color: const Color(blackColor)),
  );
}
