import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/color_app.dart';

class LogoApp extends StatelessWidget {
  const LogoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 12.h),
        Image(
          image: const AssetImage(
            "assets/images/icon top home page.png",
          ),
          width: 93.w,
          height: 32.h,
        ),
        SizedBox(height: 12.h),
        Text(
          "N E W S  W A V E",
          textAlign: TextAlign.center,
          style: GoogleFonts.ptSansNarrow(
              fontSize: 22.sp,
              fontWeight: FontWeight.w700,
              color: ColorApp.primaryColor),
        ),
        SizedBox(height: 22.h),
      ],
    );
  }
}
