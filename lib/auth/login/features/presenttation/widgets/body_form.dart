import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsappcode/auth/login/features/controller/login/login_cubit.dart';
import 'package:newsappcode/auth/login/features/controller/login/login_state.dart';
import 'package:newsappcode/core/utils/style_app.dart';
import 'custom_button.dart';
import 'custom_form_field.dart';
import 'custom_rich_text.dart';
import 'facebook_or_google.dart';

class BodyForm extends StatelessWidget {
  const BodyForm({super.key});

  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    return Form(
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
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.0584),
              child: Align(
                alignment: Alignment.topCenter,
                child: Image(
                  image: const AssetImage(
                    "assets/images/login text.png",
                  ),
                  width: MediaQuery.of(context).size.width * 0.1682,
                  height: MediaQuery.of(context).size.height * 0.02591,
                ),
              ),
            ),

            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),

            const CustomRichText(text: "username"),

            BlocBuilder<LoginCubit, LoginState>(
              builder: (context, state) {
                return CustomFormField(
                  fillColor:
                      BlocProvider.of<LoginCubit>(context).isValidateUserName
                          ? const Color(0xffFFF3F8)
                          : Colors.white,
                  hintText:
                      BlocProvider.of<LoginCubit>(context).isValidateUserName
                          ? "Input text"
                          : null,
                  suffixIcon:
                      BlocProvider.of<LoginCubit>(context).isValidateUserName
                          ? const Icon(
                              Icons.close,
                              color: Colors.red,
                            )
                          : null,
                  onSaved: (s) {},
                  validator: (value) {
                    return BlocProvider.of<LoginCubit>(context)
                        .validateUserName(value);
                  },
                );
              },
            ),

            SizedBox(
              height: MediaQuery.of(context).size.height * 0.017,
            ),

            const CustomRichText(text: "Password"),

            BlocBuilder<LoginCubit, LoginState>(
              builder: (context, state) {
                return CustomFormField(
                  fillColor:
                      BlocProvider.of<LoginCubit>(context).isValidatePassword
                          ? const Color(0xffFFF3F8)
                          : Colors.white,
                  hintText:
                      BlocProvider.of<LoginCubit>(context).isValidatePassword
                          ? "Input Password"
                          : null,
                  onSaved: (s) {},
                  validator: (v) {
                    return BlocProvider.of<LoginCubit>(context)
                        .validatePassword(v);
                  },
                  suffixIcon: BlocProvider.of<LoginCubit>(context)
                          .isValidatePassword
                      ? const Icon(
                          Icons.close,
                          color: Colors.red,
                        )
                      : IconButton(
                          icon: BlocProvider.of<LoginCubit>(context).visibility
                              ? const Icon(
                                  Icons.visibility_off,
                                  color: Color(0xff0F8ACF),
                                )
                              : const Icon(
                                  Icons.remove_red_eye,
                                  color: Color(0xff0F8ACF),
                                ),
                          onPressed: () {
                            BlocProvider.of<LoginCubit>(context).visibility =
                                !BlocProvider.of<LoginCubit>(context)
                                    .visibility;
                            debugPrint(
                                "${BlocProvider.of<LoginCubit>(context).visibility}");
                            BlocProvider.of<LoginCubit>(context)
                                .togglePasswordVisibility(
                                visibility:
                                        BlocProvider.of<LoginCubit>(context)
                                            .visibility);
                          },
                        ),
                  obscureText: BlocProvider.of<LoginCubit>(context).visibility
                      ? true
                      : false,
                );
              },
            ),

            const SizedBox(
              height: 8,
            ),

            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.038),
              child: Row(
                children: [

                  BlocBuilder<LoginCubit,LoginState>(builder: (context, state) {
                    return Checkbox(
                        value: BlocProvider.of<LoginCubit>(context).remember, onChanged: (value) {
                      BlocProvider.of<LoginCubit>(context).toggleRememberMeValue(remember: value!);
                    });
                  },),

                  Expanded(
                    child: Text(
                      "Remember me",
                      style: StyleApp.textStyle1,
                    ),
                  ),

                  TextButton(
                      onPressed: () {},
                      child: Text(
                        "Forgot the password?",
                        style: StyleApp.textStyle2,
                      )),
                ],
              ),
            ),

            SizedBox(
              height: MediaQuery.of(context).size.height * 0.0129,
            ),

            CustomButton(
              backGroundColor: const Color(0xff0F8ACF),
              nameButton: "Login",
              onTap: () {
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();
                }
              },
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.0129,
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                "or continue with",
                textAlign: TextAlign.center,
                style: StyleApp.textStyle1,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.0129,
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
                FacebookOrGoogle(
                  name: "Google",
                  image: "assets/images/google.png",
                  onTap: () {},
                  marginRight: 24,
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.0129,
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
                      "Sign Up",
                      style: StyleApp.textStyle5,
                    )),
                // FaIcon(FontAwesomeIcons.circleExclamation,)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
