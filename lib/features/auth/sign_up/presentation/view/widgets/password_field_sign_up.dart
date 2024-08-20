import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/shared_widget/custom_form_field.dart';
import '../../controller/sign_up_cubit.dart';
import '../../controller/sign_up_state.dart';

class PasswordFieldSignUp extends StatelessWidget {
  const PasswordFieldSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      builder: (context, state) {
        return CustomFormField(
          fillColor: BlocProvider.of<SignUpCubit>(context).isValidatePassword
              ? const Color(0xffFFF3F8)
              : Colors.white,
          hintText: BlocProvider.of<SignUpCubit>(context).isValidatePassword
              ? "Input Password"
              : null,
          suffixIcon: BlocProvider.of<SignUpCubit>(context).isValidatePassword
              ? const Icon(
                  Icons.close,
                  color: Colors.red,
                )
              : IconButton(
                  onPressed: () {
                    BlocProvider.of<SignUpCubit>(context)
                        .togglePasswordVisibility(
                            visibility: BlocProvider.of<SignUpCubit>(context)
                                .visibilityPassword);
                  },
                  icon: BlocProvider.of<SignUpCubit>(context).visibilityPassword
                      ? const Icon(Icons.visibility_off, color: Colors.blue)
                      : const Icon(Icons.visibility, color: Colors.blue),
                ),
          obscureText: BlocProvider.of<SignUpCubit>(context).visibilityPassword
              ? true
              : false,
          onSaved: (s) {
            BlocProvider.of<SignUpCubit>(context).password=s;
          },
          validator: (v) {
            return BlocProvider.of<SignUpCubit>(context).validatePassword(v);
          },
        );
      },
    );
  }
}
