import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newsappcode/core/shared_widget/custom_form_field.dart';
import 'package:newsappcode/core/utils/border_text_field.dart';
import 'package:newsappcode/core/utils/color_app.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsappcode/features/home_page/presentation/view/widgets/list_view_news.dart';
class HomePageBody extends StatelessWidget {
  const HomePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
            const SizedBox(height: 10,),
             Image(image: AssetImage("assets/images/icon top home page.png",),
               width: 93.w ,
               height: 32.h,
             ),
            SizedBox(height: 16.h),
            Text(
            "N E W S  W A V E",
            textAlign: TextAlign.center,
            style: GoogleFonts.ptSansNarrow(
                fontSize: 22.sp, fontWeight: FontWeight.w700, color:ColorApp.primaryColor),
          ),
          const SizedBox(height: 16,),
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
            const SizedBox(height: 24 ,),
          const Expanded(child: ListViewNews()),
      
        ],
      ),
    );
  }
}
/*
Image(image: AssetImage("assets/images/search.png",),
                  width: 14,
                  height: 14,
               ),
 */
