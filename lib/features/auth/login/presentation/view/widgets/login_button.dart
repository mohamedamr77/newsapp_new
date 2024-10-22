import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive/hive.dart';
import 'package:newsappcode/features/home_page/presentation/view/view.dart';
import '../../../../../../core/navigation/navigation_manager.dart';
import '../../../../../../core/shared_widget/custom_button.dart';
import '../../../../../../core/utils/box_app.dart';
import '../../controller/login_cubit.dart';
import '../../controller/login_state.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key, required this.formKey});
  final GlobalKey<FormState> formKey;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) async{
        // TODO: implement listener
        if (state is LoginLoadingState) {
          debugPrint("Loading state");
        }
        if (state is LoginSuccessState) {
          Fluttertoast.showToast(
            msg: "Login successfully",
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
        if (state is LoginFaliureState) {
          debugPrint(
              "SignUpFaliureState triggered with error: ${state.errorMessage}");
          Fluttertoast.showToast(
            msg: state.errorMessage,
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
          nameButton: "Login",
          onTap: () {
            if (formKey.currentState!.validate()) {
              formKey.currentState!.save();
              BlocProvider.of<LoginCubit>(context).fireBaseSignIn();
            }
          },
        );
      },
    );
  }
}
