import 'package:flutter/material.dart';
import 'package:newsappcode/core/utils/style_app.dart';
import 'custom_button.dart';
import 'custom_form_field.dart';
import 'custom_rich_text.dart';
import 'facebook_or_google.dart';

class BodyForm extends StatelessWidget {
   const BodyForm({super.key});

  @override
  Widget build(BuildContext context) {
    var formKey=GlobalKey<FormState>();
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      key:formKey,
      child: Container(
        padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height*0.032397, bottom: MediaQuery.of(context).size.height*0.032397,),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(80),
            )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.0584),
              child: Align(
                alignment: Alignment.topCenter,
                child: Image(
                  image: const AssetImage(
                    "assets/images/login text.png",
                  ),
                  width: MediaQuery.of(context).size.width *
                      0.1682,
                  height: MediaQuery.of(context).size.height *
                      0.02591,
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            const CustomRichText(text: "username"),
            CustomFormField(
              onSaved: (s) {},
              validator: (value){
               return validateUserName(value);
              },
            ),
             SizedBox(
              height: MediaQuery.of(context).size.height * 0.017,
            ),
            const CustomRichText(text: "Password"),
            CustomFormField(
              onSaved: (s) {},
              validator:(v){
                return validatePassword(v);
              },
              suffixIcon: const Icon(
                Icons.remove_red_eye,
                color: Colors.blue,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.038),
              child: Row(
                children: [
                  Checkbox(value: true, onChanged: (value) {}),
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
              height: MediaQuery.of(context).size.height*0.0129,
            ),
            CustomButton(
                backGroundColor: const Color(0xff0F8ACF),
                nameButton: "Login",
                onTap:  () {
                  if(formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                  }

                },),
             SizedBox(
              height: MediaQuery.of(context).size.height*0.0129,
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
               height: MediaQuery.of(context).size.height*0.0129,
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
               height: MediaQuery.of(context).size.height*0.0129,
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

String? validateUserName(String? value) {
  if (value == null || value.isEmpty) {
    return "❗ Invalid Username";
  }
  return null;
}

String? validatePassword(String? value) {
  if (value == null || value.isEmpty) {
    return "❗ Password error";
  }
  return null;
}