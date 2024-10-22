import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsappcode/features/auth/sign_up/data/sign_up_implement.dart';
import 'package:newsappcode/features/auth/sign_up/presentation/controller/sign_up_state.dart';
import 'package:newsappcode/features/auth/sign_up/presentation/view/widgets/sign_up_body.dart';

import '../controller/sign_up_cubit.dart';
import '../controller/validation_cubit/validation_sign_up_cubit.dart';

class SignUpScreen extends StatelessWidget {
  static const String id = "/SignUpScreen";
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SignUpCubit>(
          create: (context) => SignUpCubit(SignUpImplementation()),
        ),
        BlocProvider<ValidationSignUpCubit>(
          create: (context) => ValidationSignUpCubit(),
        ),
      ],
      child: Stack(
        children: [
          const Scaffold(
            backgroundColor: Color(0xff0F8ACF),
            body: SignUpBody(),
          ),
          BlocBuilder<SignUpCubit, SignUpState>(
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
      ),
    );
  }
}
