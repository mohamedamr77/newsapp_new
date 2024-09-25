import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:newsappcode/core/shared_widget/build_shimmer_shape.dart';

import '../../../../../core/shared_widget/custom_form_field.dart';
import '../../../../../core/shared_widget/logo_app.dart';
import '../../../../../core/utils/border_text_field.dart';
import '../../../../../core/utils/color_app.dart';

class SearchBody extends StatelessWidget {
  const SearchBody({super.key});

  @override
  Widget build(BuildContext context) {
    return   SafeArea(
      child: Column(
        children: [
          const LogoApp(),
          CustomFormField(
            fillColor: ColorApp.whiteColor,
            hintText: "Search",
            enabledBorder:
            BorderTextField.enabledBorderTextFormFieldHomePage,
            focusBorder: BorderTextField.focusedBorderTextFormFieldHomePage,
            prefixIcon: Padding(
              padding: const EdgeInsets.all(12.0),
              child: SvgPicture.asset(
                "assets/images/svg/Vector.svg",
              ),
            ),
          ),

        ],
      ),
    );
  }
}
