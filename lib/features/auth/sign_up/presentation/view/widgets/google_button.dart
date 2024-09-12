import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../../login/presentation/view/widgets/facebook_or_google.dart';
import '../../../../view_mdoel/auth_cubit/auth_cubit.dart';
import '../../../../view_mdoel/auth_cubit/auth_state.dart';

class GoogleButton extends StatelessWidget {
  const GoogleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      builder: (BuildContext context, state) {
        return FacebookOrGoogle(
          name: "Google",
          image: "assets/images/google.png",
          onTap: () {
            BlocProvider.of<AuthCubit>(context).signInWithGoogle();
          },
          marginRight: 24,
        );
      },
      listener: (BuildContext context, Object? state) {
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
          Navigator.pop(context);
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
