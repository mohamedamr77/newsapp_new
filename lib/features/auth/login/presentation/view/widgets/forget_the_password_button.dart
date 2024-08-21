import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../../../../core/utils/style_app.dart';
import '../../controller/login_cubit.dart';
import '../../controller/login_state.dart';

class ForgetThePasswordButton extends StatelessWidget {
  const ForgetThePasswordButton({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<LoginCubit,LoginState>(
      builder: (context, state) {
        return TextButton(
            onPressed: (){
              BlocProvider.of<LoginCubit>(context).forgetThePassword(context: context);
            },
            child: Text(
              "Forgot the password?",
              style: StyleApp.textStyle2,
            )
        );
      },
      listener: (context, state) {
        if (state is ForgetThePasswordMessageSentSuccessfullyState) {
          Fluttertoast.showToast(
            msg: "We Sent Message to your Email Please Check Your Email",
            fontSize: 16,
            backgroundColor: Colors.blue,
            textColor: Colors.white,
            timeInSecForIosWeb: 4,
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.CENTER,
            webShowClose: true,
          );

        }
        else if (state is ForgetThePasswordMessageNotSentState) {
          debugPrint("error forget password :: ${state.message}");
          Fluttertoast.showToast(
            msg: state.message,
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
