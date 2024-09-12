import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsappcode/features/auth/login/presentation/view/widgets/login_body.dart';
import 'package:newsappcode/features/auth/view_mdoel/auth_cubit/auth_cubit.dart';
import 'package:newsappcode/features/auth/view_mdoel/auth_cubit/auth_state.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      const Scaffold(
        backgroundColor: Color(0xff0F8ACF),
        body: LoginBody(),
      ),
      BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          if (state is LoginLoadingState ||
              state is ForgetThePasswordMessageLoadingState) {
            return Container(
              alignment: Alignment.center,
              color: Colors.black12,
              child: const CircularProgressIndicator(
                color: Color(0xff0F8ACF),
              ),
            );
          } else {
            return const SizedBox();
          }
        },
      )
    ]);
  }
}
