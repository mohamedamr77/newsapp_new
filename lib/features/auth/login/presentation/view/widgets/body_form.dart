import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsappcode/core/utils/style_app.dart';
import 'package:newsappcode/features/auth/login/presentation/view/widgets/custom_text_for_style_1.dart';
import 'package:newsappcode/features/auth/login/presentation/view/widgets/password_field.dart';
import 'package:newsappcode/features/auth/login/presentation/view/widgets/username_field.dart';
import '../../controller/login_cubit.dart';
import '../../controller/login_state.dart';
import '../../../../../../core/shared_widget/custom_button.dart';
import '../../../../../../core/shared_widget/custom_form_field.dart';
import 'check_box_button.dart';
import 'custom_rich_text.dart';
import 'facebook_or_google.dart';

class BodyForm extends StatelessWidget {
  const BodyForm({super.key});

  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    return BlocProvider(
      create: (context) => LoginCubit(),
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

              SizedBox(height: MediaQuery.of(context).size.height * 0.03,),

              const CustomRichText(text: "username"),

              const UsernameField(),

              SizedBox(height: MediaQuery.of(context).size.height * 0.017,),

              const CustomRichText(text: "Password"),

              const PasswordField(),

              const SizedBox(height: 8,),

              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.038),
                child: Row(
                  children: [
                    const CheckBoxButton(),
                    CustomTextForStyle1(text:  "Remember me",),
                    Spacer(),
                    //Forgot the password?
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          "Forgot the password?",
                          style: StyleApp.textStyle2,
                        )),
                  ],
                ),
              ),

              SizedBox(height: MediaQuery.of(context).size.height * 0.0129,),

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
                child: CustomTextForStyle1(text: "or Continue With ",textAlign: TextAlign.center,)
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
                  const SizedBox(width: 16,),
                  FacebookOrGoogle(
                    name: "Google",
                    image: "assets/images/google.png",
                    onTap: () {},
                    marginRight: 24,
                  ),
                ],
              ),

              SizedBox(height: MediaQuery.of(context).size.height * 0.0129,),

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
      ),
    );
  }
}
