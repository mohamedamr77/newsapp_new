import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsappcode/core/shared_widget/build_shimmer_shape.dart';
import 'package:newsappcode/core/shared_widget/logo_app.dart';
import 'package:newsappcode/core/utils/color_app.dart';

class TopicsBody extends StatelessWidget {
  const TopicsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:  SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            SizedBox(height: 20.h,),
            const LogoApp(),
            const Divider(
              color: ColorApp.primaryColor,
            ),



          ],
        ),
      ),
    );
  }
}
