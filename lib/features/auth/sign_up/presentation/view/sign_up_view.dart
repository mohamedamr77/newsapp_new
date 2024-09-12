import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsappcode/features/auth/sign_up/presentation/view/widgets/sign_up_body.dart';
import '../../../view_mdoel/auth_cubit/auth_cubit.dart';
import '../../../view_mdoel/auth_cubit/auth_state.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Scaffold(
          backgroundColor: Color(0xff0F8ACF),
          body: SignUpBody(),
        ),
        BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {
            if (state is SignUpLoadingState ||
                state is SignUpLoadingWithGoogleState) {
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
      ],
    );
  }
}
