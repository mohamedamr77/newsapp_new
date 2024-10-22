import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:newsappcode/core/navigation/navigation_manager.dart';

import '../../../../../../core/shared_widget/custom_button.dart';
import '../../controller/sign_up_cubit.dart';
import '../../controller/sign_up_state.dart';

class SignUpButton extends StatelessWidget {
  const SignUpButton({super.key, required this.formKey});
  final GlobalKey<FormState> formKey;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state is SignUpSuccessState) {
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
          NavigationManager.goBack();
        } else if (state is SignUpFaliureState) {
          debugPrint("SignUpFaliureState triggered with error: ${state.error}");
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
      builder: (context, state) {
        return CustomButton(
          backGroundColor: const Color(0xff0F8ACF),
          nameButton: "Sign Up",
          onTap: () async {
            if (formKey.currentState!.validate()) {
              formKey.currentState!.save();
              BlocProvider.of<SignUpCubit>(context).fireBaseSignUp();
            }
          },
        );
      },
    );
  }
}
