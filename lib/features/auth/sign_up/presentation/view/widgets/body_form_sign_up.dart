import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsappcode/core/shared_widget/custom_button.dart';
import 'package:newsappcode/core/shared_widget/custom_form_field.dart';
import 'package:newsappcode/features/auth/shared_widget_auth/custom_text_for_style_1.dart';
import 'package:newsappcode/features/auth/shared_widget_auth/image_top_container_form.dart';
import 'package:newsappcode/features/auth/sign_up/presentation/controller/sign_up_cubit.dart';
import 'package:newsappcode/features/auth/sign_up/presentation/controller/sign_up_state.dart';
import 'package:newsappcode/features/auth/sign_up/presentation/view/widgets/username_field_signup.dart';
import '../../../../../../core/utils/style_app.dart';
import '../../../../login/presentation/view/widgets/custom_rich_text.dart';
import '../../../../login/presentation/view/widgets/facebook_or_google.dart';

class BodyFormSignUp extends StatelessWidget {
  const BodyFormSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    return BlocProvider(
      create: (context) => SignUpCubit(),
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
              BlocBuilder<SignUpCubit, SignUpState>(
                builder: (context, state) {
                  return CustomFormField(
                    onSaved: (s) {},
                    fillColor: Colors.white,
                    validator: (v) {
                      return BlocProvider.of<SignUpCubit>(context)
                          .validatePassword(v);
                    },
                  );
                },
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.017,
              ),
              const CustomRichText(text: "Confirm Password"),
              BlocBuilder<SignUpCubit, SignUpState>(
                builder: (context, state) {
                  return CustomFormField(
                    validator: (v) {
                      return BlocProvider.of<SignUpCubit>(context)
                          .validateConfirmPassword(v);
                    },
                    onSaved: (s) {},
                    fillColor: Colors.white,
                  );
                },
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              CustomButton(
                backGroundColor: const Color(0xff0F8ACF),
                nameButton: "Signup",
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                  }
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
                  FacebookOrGoogle(
                    name: "Google",
                    image: "assets/images/google.png",
                    onTap: () {},
                    marginRight: 24,
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
