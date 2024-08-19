import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/shared_widget/custom_form_field.dart';
import '../../controller/sign_up_cubit.dart';
import '../../controller/sign_up_state.dart';

class UsernameFieldSignup extends StatelessWidget {
  const UsernameFieldSignup({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<SignUpCubit, SignUpState>(
      builder: (context, state) {
        return CustomFormField(
          hintText:
          BlocProvider.of<SignUpCubit>(context).isValidateUserName
              ? "Input UserName"
              : null,
          suffixIcon:
          BlocProvider.of<SignUpCubit>(context).isValidateUserName
              ? const Icon(
            Icons.close,
            color: Colors.red,
          )
              : null,
          onSaved: (s) {},
          fillColor:
          BlocProvider.of<SignUpCubit>(context).isValidateUserName
              ? const Color(0xffFFF3F8)
              : Colors.white,
          validator: (v) {
            return BlocProvider.of<SignUpCubit>(context)
                .validateUserName(v);
          },
        );
      },
    );
  }
}
