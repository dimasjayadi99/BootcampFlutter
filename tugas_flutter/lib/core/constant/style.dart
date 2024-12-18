import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tugas_flutter/core/constant/color.dart';

class StyleConst {
  StyleConst._();

  static var myTextTheme = TextTheme(
    displayLarge: GoogleFonts.poppins(
        fontSize: 97,
        fontWeight: FontWeight.w300,
        letterSpacing: -1.5,
        color: const Color(blackColor)),
    displayMedium: GoogleFonts.poppins(
        fontSize: 61,
        fontWeight: FontWeight.w300,
        letterSpacing: -0.5,
        color: const Color(blackColor)),
    displaySmall: GoogleFonts.poppins(
        fontSize: 48,
        fontWeight: FontWeight.w400,
        color: const Color(blackColor)),
    headlineLarge: GoogleFonts.poppins(
        fontSize: 34,
        fontWeight: FontWeight.w700,
        letterSpacing: 0.25,
        color: const Color(blackColor)),
    headlineMedium: GoogleFonts.poppins(
        fontSize: 26,
        fontWeight: FontWeight.w400,
        color: const Color(blackColor)),
    headlineSmall: GoogleFonts.roboto(
        fontSize: 15,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.15,
        color: const Color(blackColor)),
    titleLarge: GoogleFonts.poppins(
        fontSize: 18,
        fontWeight: FontWeight.w900,
        letterSpacing: 0.15,
        color: const Color(blackColor)),
    titleMedium: GoogleFonts.poppins(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.1,
        color: const Color(blackColor)),
    bodyLarge: GoogleFonts.poppins(
        fontSize: 18,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.5,
        color: const Color(blackColor)),
    bodyMedium: GoogleFonts.poppins(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.25,
        color: const Color(blackColor)),
    bodySmall: GoogleFonts.poppins(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.25,
        color: const Color(blackColor)),
    labelMedium: GoogleFonts.poppins(
        fontSize: 12,
        fontWeight: FontWeight.w900,
        letterSpacing: 0.4,
        color: const Color(blackColor)),
    labelSmall: GoogleFonts.poppins(
        fontSize: 10,
        fontWeight: FontWeight.w400,
        letterSpacing: 1.5,
        color: const Color(blackColor)),
  );
}
