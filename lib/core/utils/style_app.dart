import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StyleApp {
  static final textStyle1 = GoogleFonts.poppins(
      fontWeight: FontWeight.w400,
      fontSize: 14,
      color: const Color(0xff4E4B66));
  static final textStyle2 = GoogleFonts.poppins(
      fontWeight: FontWeight.w400,
      fontSize: 12,
      color: const Color(0xff0F8ACF).withOpacity(0.8));
  static final textStyle3 = GoogleFonts.poppins(
      fontWeight: FontWeight.w600, fontSize: 16, color: Colors.white);
  static final textStyle4 = GoogleFonts.poppins(
    fontWeight: FontWeight.w600,
    fontSize: 16,
    color: const Color(0xff667080),
  );
  static final textStyle5 = GoogleFonts.poppins(
    fontWeight: FontWeight.w600,
    fontSize: 16,
    color: const Color(0xff0F8ACF),
  );
}
