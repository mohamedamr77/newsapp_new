import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive/hive.dart';
import 'package:newsappcode/core/navigation/navigation_manager.dart';
import 'package:newsappcode/features/home_page/presentation/view/view.dart';

import '../../../../../../core/utils/box_app.dart';
import '../../../../login/presentation/view/widgets/facebook_or_google.dart';
import '../../controller/sign_up_cubit.dart';
import '../../controller/sign_up_state.dart';

class GoogleButton extends StatelessWidget {
  const GoogleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit, SignUpState>(
      builder: (BuildContext context, state) {
        return FacebookOrGoogle(
          name: "Google",
          image: "assets/images/google.png",
          onTap: () {
            BlocProvider.of<SignUpCubit>(context).signInWithGoogle();
          },
          marginRight: 24,
        );
      },
      listener: (BuildContext context, Object? state) async{
        if (state is SignUpLoadingState) {
          debugPrint("Loading state");
        }
        if (state is SignUpSuccessWithGoogleState) {
          Fluttertoast.showToast(
            msg: "Sign up successfully",
            fontSize: 16,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            timeInSecForIosWeb: 2,
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.SNACKBAR,
            webShowClose: true,
          );
          var box = Hive.box(BoxApp.userLoginBox);
          await box.put("userLogin", true );
          NavigationManager.replaceAll(HomePageScreen.id);
        }
        if (state is SignUpFaliureWithGoogleState) {
          Fluttertoast.showToast(
            msg: state.error,
            fontSize: 16,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            timeInSecForIosWeb: 2,
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            webShowClose: true,
          );
        }
      },
    );
  }
}
