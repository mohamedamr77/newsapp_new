import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ListViewBody extends StatelessWidget {
  const ListViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20, left: 24, right: 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image(
            image: const AssetImage("assets/images/gaza news.png"),
            height: 195.h,
            width: double.infinity,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12),
            child: Text(
              "GAZA",
              textAlign: TextAlign.start,
              style: GoogleFonts.poppins(
                fontSize: 13,
                fontWeight: FontWeight.w400,
                color: const Color(0xff4E4B66),
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
          Padding(
            padding: const EdgeInsets.only(left: 12, top: 6),
            child: Row(
              children: [
                const CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 10,
                  child: Image(
                    image: AssetImage("assets/images/bbc news.png"),
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                  ),
                ),
                const SizedBox(width: 6),
                Text(
                  'BBC News',
                  style: GoogleFonts.poppins(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xff4E4B66)),
                ),
                const SizedBox(width: 12),
                const CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 7,
                  child: Image(
                    image: AssetImage("assets/images/time.png"),
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                  ),
                ),
                const SizedBox(width: 6),
                Text(
                  '7h ago',
                  style: GoogleFonts.poppins(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xff4E4B66)),
                ),
                const Spacer(),
                GestureDetector(
                    onTap: () {}, child: const Icon(Icons.bookmark_border))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
