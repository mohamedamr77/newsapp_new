import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newsappcode/features/topics/data/model/model.dart';

class GridViewItem extends StatelessWidget {
  const GridViewItem({super.key, required this.topicsModel});
 final TopicsModel topicsModel;
  @override
  Widget build(BuildContext context) {
    return  Container(
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
            child: Image(image:  AssetImage(topicsModel.image,),
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(height: 5.h,),
          Expanded(child: Text(topicsModel.title,
              style: GoogleFonts.poppins(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 18.sp,
              )
          ))
        ],
      ),
    );
  }
}
