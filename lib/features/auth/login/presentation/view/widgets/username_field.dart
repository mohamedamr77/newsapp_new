import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/shared_widget/custom_form_field.dart';
import '../../controller/login_cubit.dart';
import '../../controller/login_state.dart';

class UsernameField extends StatelessWidget {
  const UsernameField({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return CustomFormField(
          fillColor:
          BlocProvider.of<LoginCubit>(context).isValidateUserName
              ? const Color(0xffFFF3F8)
              : Colors.white,
          hintText:
          BlocProvider.of<LoginCubit>(context).isValidateUserName
              ? "Input text"
              : null,
          suffixIcon:
          BlocProvider.of<LoginCubit>(context).isValidateUserName
              ? const Icon(
            Icons.close,
            color: Colors.red,
          )
              : null,
          onSaved: (s) {},
          validator: (value) {
            return BlocProvider.of<LoginCubit>(context)
                .validateUserName(value);
          },
        );
      },
    );
  }
}
