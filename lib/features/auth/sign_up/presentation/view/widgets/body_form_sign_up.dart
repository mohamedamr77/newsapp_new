import 'package:flutter/material.dart';
import 'package:newsappcode/core/navigation/navigation_manager.dart';
import 'package:newsappcode/features/auth/shared_widget_auth/custom_text_for_style_1.dart';
import 'package:newsappcode/features/auth/shared_widget_auth/image_top_container_form.dart';
import 'package:newsappcode/features/auth/sign_up/presentation/view/widgets/password_field_sign_up.dart';
import 'package:newsappcode/features/auth/sign_up/presentation/view/widgets/sign_up_button.dart';
import 'package:newsappcode/features/auth/sign_up/presentation/view/widgets/username_field_signup.dart';
import '../../../../../../core/utils/style_app.dart';
import '../../../../login/presentation/view/widgets/custom_rich_text.dart';
import 'confirm_password_field.dart';
import 'facebook_button.dart';
import 'google_button.dart';

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
              SignUpButton(formKey: formKey),
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
              // facebook  google button

              const Row(
                children: [
                  FacebookButton(),
                  SizedBox(
                    width: 16,
                  ),
                  GoogleButton(),
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
                      onPressed: () {
                        NavigationManager.goBack();
                      },
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
