import 'package:flutter/material.dart';
import 'package:newsappcode/core/utils/style_app.dart';
import 'package:newsappcode/features/auth/login/presentation/view/widgets/facebook_button.dart';
import 'package:newsappcode/features/auth/login/presentation/view/widgets/google_button.dart';
import 'package:newsappcode/features/auth/login/presentation/view/widgets/login_button.dart';
import 'package:newsappcode/features/auth/shared_widget_auth/custom_text_for_style_1.dart';
import 'package:newsappcode/features/auth/login/presentation/view/widgets/password_field.dart';
import 'package:newsappcode/features/auth/login/presentation/view/widgets/username_field.dart';
import 'package:newsappcode/features/auth/sign_up/presentation/view/sign_up_view.dart';
import '../../../../shared_widget_auth/image_top_container_form.dart';
import 'check_box_button.dart';
import 'custom_rich_text.dart';
import 'forget_the_password_button.dart';

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
            const ImageTopContainerForm(
              imagePath: "assets/images/login text.png",
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            const CustomRichText(text: "username"),
            const UsernameField(),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.017,
            ),
            const CustomRichText(text: "Password"),
            const PasswordField(),
            const SizedBox(
              height: 8,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.038),
              child: const Row(
                children: [
                  CheckBoxButton(),
                  CustomTextForStyle1(
                    text: "Remember me",
                  ),
                  Spacer(),
                  //Forgot the password?
                  ForgetThePasswordButton(),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.0129,
            ),
            LoginButton(formKey: formKey,),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.0129,
            ),
            const Align(
                alignment: Alignment.center,
                child: CustomTextForStyle1(
                  text: "or Continue With ",
                  textAlign: TextAlign.center,
                )),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.0129,
            ),
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
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return const SignUpScreen();
                        },
                      ));
                    },
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
