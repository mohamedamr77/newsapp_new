import 'package:flutter/material.dart';
import 'package:newsappcode/features/auth/sign_up/presentation/view/widgets/sign_up_body.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xff0F8ACF),
      body: SignUpBody(),
    );
  }
}
