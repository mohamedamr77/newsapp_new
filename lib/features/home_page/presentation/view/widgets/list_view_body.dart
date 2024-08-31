import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ListViewBody extends StatelessWidget {
  const ListViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding:  const EdgeInsets.only(bottom: 10,left: 24,right: 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image(image: const AssetImage("assets/images/gaza news.png"),
          height:195.h,
          width: double.infinity,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12),
            child: Text("GAZA",
            textAlign: TextAlign.start,
            style: GoogleFonts.poppins(
              fontSize: 13,
              fontWeight: FontWeight.w400,
              color: Color(0xff4E4B66),
            ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12),
            child: Text(
              'Gaza War: "Where can we hide from the death coming from the sky?" ',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
            ),
          ),
          Row(
            children: [

            ],
          )

        ],
      ),
    );
  }
}
