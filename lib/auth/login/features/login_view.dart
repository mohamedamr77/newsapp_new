import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsappcode/auth/login/features/presenttation/widgets/login_body.dart';

import 'controller/login/login_cubit.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: const Scaffold(
        backgroundColor: Color(0xff0F8ACF),
        body: LoginBody(),
      ),
    );
  }
}
