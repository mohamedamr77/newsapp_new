import 'dart:developer';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:newsappcode/core/shared_widget/custom_button.dart';
import 'package:newsappcode/features/auth/shared_widget_auth/custom_text_for_style_1.dart';
import 'package:newsappcode/features/auth/shared_widget_auth/image_top_container_form.dart';
import 'package:newsappcode/features/auth/sign_up/presentation/controller/sign_up_cubit.dart';
import 'package:newsappcode/features/auth/sign_up/presentation/controller/sign_up_state.dart';
import 'package:newsappcode/features/auth/sign_up/presentation/view/widgets/password_field_sign_up.dart';
import 'package:newsappcode/features/auth/sign_up/presentation/view/widgets/username_field_signup.dart';
import '../../../../../../core/utils/style_app.dart';
import '../../../../login/presentation/view/widgets/custom_rich_text.dart';
import '../../../../login/presentation/view/widgets/facebook_or_google.dart';
import 'confirm_password_field.dart';
import 'package:firebase_auth/firebase_auth.dart';

class BodyFormSignUp extends StatelessWidget {
  const BodyFormSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    return SliverToBoxAdapter(
      child: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        key: formKey,
        child: Container(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * 0.032397,
            bottom: MediaQuery.of(context).size.height * 0.032397,
          ),
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(80),
              )),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ImageTopContainerForm(
                  imagePath: "assets/images/sign up form.png"),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              const CustomRichText(text: "username"),
              const SizedBox(
                height: 6,
              ),
              const UsernameFieldSignup(),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.017,
              ),
              const CustomRichText(text: "Password"),
              const PasswordFieldSignUp(),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.017,
              ),
              const CustomRichText(text: "Confirm Password"),
              const ConfirmPasswordField(),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              BlocConsumer<SignUpCubit, SignUpState>(
                listener: (context, state) {
                  // if(state is SignUpLoadingState){
                  //   debugPrint("Loading state");
                  // }
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
                    Navigator.pop(context);
                  } else if (state is SignUpFaliureState) {
                    debugPrint(
                        "SignUpFaliureState triggered with error: ${state.error}");
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
                  return state is SignUpLoadingState ||
                          state is SignUpSuccessState
                      ? const Center(child: CircularProgressIndicator())
                      : CustomButton(
                          backGroundColor: const Color(0xff0F8ACF),
                          nameButton: "Sign Up",
                          onTap: () async {
                            if (formKey.currentState!.validate()) {
                              formKey.currentState!.save();
                              BlocProvider.of<SignUpCubit>(context)
                                  .fireBaseSignUp();
                            }
                          },
                        );
                },
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.017,
              ),
              const Align(
                  alignment: Alignment.center,
                  child: CustomTextForStyle1(
                    text: "or continue with",
                    textAlign: TextAlign.center,
                  )),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.017,
              ),
              Row(
                children: [
                  FacebookOrGoogle(
                    name: "Facebook",
                    image: "assets/images/face icon.png",
                    onTap: () {},
                    marginLeft: 24,
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  BlocConsumer<SignUpCubit, SignUpState>(
                    builder: (BuildContext context, state) {
                      return FacebookOrGoogle(
                              name: "Google",
                              image: "assets/images/google.png",
                              onTap: () {
                                BlocProvider.of<SignUpCubit>(context)
                                    .signInWithGoogle();
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
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.011,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "don’t have an account ?",
                    style: StyleApp.textStyle1,
                  ),

                  TextButton(
                      onPressed: () {},
                      child: Text(
                        "Login ",
                        style: StyleApp.textStyle5,
                      )),
                  // FaIcon(FontAwesomeIcons.circleExclamation,)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
