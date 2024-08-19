import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomRichText extends StatelessWidget {
  const CustomRichText({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: RichText(
          text: TextSpan(
              text: text,
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: const Color(0xff4E4B66),
              ),
              children: [
            TextSpan(
              text: "*",
              style: GoogleFonts.poppins(color: Colors.red),
            )
          ])),
    );
  }
}
