import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../core/shared_widget/custom_form_field.dart';
import '../../../../../core/utils/border_text_field.dart';
import '../../../../../core/utils/color_app.dart';

class CustomSliverAppbar extends StatelessWidget {
  const CustomSliverAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return  SliverAppBar(
      expandedHeight: 195.h,
      backgroundColor: ColorApp.whiteColor,
      floating: false,
      pinned: false,
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          color: Colors.white,
          child: Column(
            children: [
              SizedBox(height: 12.h),
              Image(image: const AssetImage("assets/images/icon top home page.png",),
                width: 93.w ,
                height: 32.h,
              ),
              SizedBox(height: 12.h),
              Text(
                "N E W S  W A V E",
                textAlign: TextAlign.center,
                style: GoogleFonts.ptSansNarrow(
                    fontSize: 22.sp, fontWeight: FontWeight.w700, color:ColorApp.primaryColor),
              ),
              SizedBox(height: 22.h),
              CustomFormField(
                fillColor: ColorApp.whiteColor,
                hintText: "Search",
                enabledBorder: BorderTextField.enabledBorderTextFormFieldHomePage,
                focusBorder: BorderTextField.focusedBorderTextFormFieldHomePage,
                prefixIcon:  Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: SvgPicture.asset("assets/images/svg/Vector.svg",
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
