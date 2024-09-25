import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newsappcode/core/shared_widget/build_shimmer_shape.dart';
import 'package:newsappcode/core/shared_widget/logo_app.dart';
import 'package:newsappcode/core/utils/color_app.dart';

import 'grid_view_topics.dart';

class TopicsBody extends StatelessWidget {
  const TopicsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:  SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20.h,),
            const LogoApp(),
            const Divider(
              color: ColorApp.primaryColor,
            ),
            SizedBox(height: 20.h,),
            const GridViewTopics()
          ],
        ),
      ),
    );
  }
}
/*
Row(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               Container(
                 width: 178.w,
                 height: 175.h,
                 decoration: BoxDecoration(
                   color: Colors.white,
                   borderRadius: BorderRadius.circular(12.w),
                   boxShadow: [
                     BoxShadow(
                       color: Colors.grey.withOpacity(0.4),
                       spreadRadius: 2,
                       blurRadius: 7,
                       offset: const Offset(0, 0), // changes position of shadow
                     ),
                   ],
                 ),
                 child: Column(
                   children: [
                     ClipRRect(
                       borderRadius: BorderRadius.only(
                         topLeft: Radius.circular(12.w),
                         topRight: Radius.circular(12.w),

                       ),

                       child: Image(image: const AssetImage("assets/images/technology.png",),
                         fit: BoxFit.fitWidth,
                         height: 135.h,
                       ),
                     ),
                     SizedBox(height: 5.h,),
                     Expanded(child: Text("technology",
                         style: GoogleFonts.poppins(
                           color: Colors.black,
                           fontWeight: FontWeight.w600,
                           fontSize: 18.sp,
                         )
                     ))
                   ],
                 ),
               ),
                SizedBox(width: 20.w,),
               Container(
                 width: 178.w,
                 height: 175.h,
                 decoration: BoxDecoration(
                   color: Colors.white,
                   borderRadius: BorderRadius.circular(12.w),
                   boxShadow: [
                     BoxShadow(
                       color: Colors.grey.withOpacity(0.4),
                       spreadRadius: 2,
                       blurRadius: 7,
                       offset: const Offset(0, 0), // changes position of shadow
                     ),
                   ],
                 ),
                 child: Column(
                   children: [
                     ClipRRect(
                       borderRadius: BorderRadius.only(
                         topLeft: Radius.circular(12.w),
                         topRight: Radius.circular(12.w),

                       ),

                       child: Image(image: const AssetImage("assets/images/technology.png",),
                         fit: BoxFit.fitWidth,
                         height: 135.h,
                       ),
                     ),
                     SizedBox(height: 5.h,),
                     Expanded(child: Text("technology",
                         style: GoogleFonts.poppins(
                           color: Colors.black,
                           fontWeight: FontWeight.w600,
                           fontSize: 18.sp,
                         )
                     ))
                   ],
                 ),
               ),
             ],
           )
 */