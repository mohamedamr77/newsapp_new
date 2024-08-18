import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTopView extends StatelessWidget {
  const CustomTopView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image(
          image: const AssetImage("assets/images/logo.png"),
          width: MediaQuery.of(context).size.width * 0.4345,
          height: MediaQuery.of(context).size.height * 0.088,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.0129,
        ),
        Text(
          "NEWS WAVE",
          textAlign: TextAlign.center,
          style: GoogleFonts.ptSansNarrow(
              fontSize: 28, fontWeight: FontWeight.w700, color: Colors.white),
        ),
      ],
    );
  }
}
