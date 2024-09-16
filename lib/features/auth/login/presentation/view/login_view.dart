import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsappcode/features/auth/login/data/repo/login_repo_implement.dart';
import 'package:newsappcode/features/auth/login/presentation/controller/login_state.dart';
import 'package:newsappcode/features/auth/login/presentation/view/widgets/login_body.dart';
import '../controller/login_cubit.dart';
import '../controller/validation_cubit/login_validation_cubit.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  MultiBlocProvider(
      providers: [
        BlocProvider<LoginCubit>(
          create: (context) => LoginCubit(LoginRepoImplement()),
        ),
        BlocProvider<LoginValidationCubit>(
          create: (context) => LoginValidationCubit(),
        ),
      ],
      child: Stack(
        children:  [
          const Scaffold(
            backgroundColor: Color(0xff0F8ACF),
            body: LoginBody(),
          ),

          BlocBuilder<LoginCubit,LoginState>(builder: (context, state) {
            if (state is LoginLoadingState || state is ForgetThePasswordMessageLoadingState)
            {
              return  Container(
                alignment: Alignment.center,
                color: Colors.black12,
                child: const CircularProgressIndicator(
                  color:  Color(0xff0F8ACF),
                ),
              );
            } else {
              return const SizedBox();
            }
          },)
        ]
      ),
    );
  }
}
