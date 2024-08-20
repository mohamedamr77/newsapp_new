import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsappcode/features/auth/shared_widget_auth/custom_top_view.dart';
import 'package:newsappcode/features/auth/sign_up/presentation/view/widgets/body_form_sign_up.dart';

import '../../controller/sign_up_cubit.dart';
import '../../controller/validation_cubit/validation_sign_up_cubit.dart';

class SignUpBody extends StatelessWidget {
  const SignUpBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.10,
          ),
        ),
        const SliverToBoxAdapter(
          child: CustomTopView(),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.04643628,
          ),
        ),
         MultiBlocProvider(

             providers: [
               BlocProvider<SignUpCubit>(
                 create: (context) => SignUpCubit(),
               ),
               BlocProvider<ValidationSignUpCubit>(
                 create: (context) => ValidationSignUpCubit(),
               ),

             ],
             child: const BodyFormSignUp())
      ],
    );
  }
}
