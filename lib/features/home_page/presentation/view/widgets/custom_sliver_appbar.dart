import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hive/hive.dart';
import 'package:newsappcode/core/navigation/navigation_manager.dart';
import 'package:newsappcode/features/auth/login/presentation/view/login_view.dart';
import '../../../../../core/shared_widget/logo_app.dart';
import '../../../../../core/utils/box_app.dart';
import '../../../../../core/utils/color_app.dart';
import '../../../../../core/utils/style_app.dart';
import '../../../../search/presentation/view/search_view.dart';

class CustomSliverAppbar extends StatelessWidget {
  const CustomSliverAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 195.h,
      backgroundColor: ColorApp.whiteColor,
      floating: false,
      pinned: false,
      leading: IconButton(
          onPressed: () async {
            GoogleSignIn googleSignIn = GoogleSignIn();
            googleSignIn.disconnect();
            await FirebaseAuth.instance.signOut();
            var box = Hive.box(BoxApp.userLoginBox);
            await box.put("userLogin", false );
            NavigationManager.replaceAll(LoginScreen.id);
          },
          icon: Icon(
            Icons.no_accounts,
            size: 40.w,
          )),
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          color: Colors.white,
          child: Column(
            children: [
              const LogoApp(),
              GestureDetector(
                onTap: () {
                  NavigationManager.push(SearchView.id);
                },
                child: Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(vertical: 4.h, horizontal: 20.w),
                  padding:
                      EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.w),
                    color: ColorApp.whiteColor,
                    border: Border.all(
                      width: 1.w,
                      color: ColorApp.primaryColor,
                    ),
                  ),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        "assets/images/svg/Vector.svg",
                      ),
                      SizedBox(
                        width: 16.w,
                      ),
                      Text(
                        "Search",
                        style: StyleApp.textStyle6,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
