import 'package:flutter/material.dart';
import 'package:newsappcode/features/auth/login/presentation/view/widgets/login_body.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xff0F8ACF),
      body: LoginBody(),
    );
  }
}
