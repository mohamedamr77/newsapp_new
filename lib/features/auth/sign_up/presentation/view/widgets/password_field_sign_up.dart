import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/shared_widget/custom_form_field.dart';
import '../../controller/sign_up_cubit.dart';
import '../../controller/validation_cubit/validation_sign_up_cubit.dart';
import '../../controller/validation_cubit/validation_sign_up_state.dart';

class PasswordFieldSignUp extends StatelessWidget {
  const PasswordFieldSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ValidationSignUpCubit, ValidationSignUpState>(
      builder: (context, state) {
        return CustomFormField(
          fillColor:
              BlocProvider.of<ValidationSignUpCubit>(context).isValidatePassword
                  ? const Color(0xffFFF3F8)
                  : Colors.white,
          hintText:
              BlocProvider.of<ValidationSignUpCubit>(context).isValidatePassword
                  ? "Input Password"
                  : null,
          suffixIcon: BlocProvider.of<ValidationSignUpCubit>(context)
                  .isValidatePassword
              ? const Icon(
                  Icons.close,
                  color: Colors.red,
                )
              : IconButton(
                  onPressed: () {
                    log(BlocProvider.of<ValidationSignUpCubit>(context)
                        .isValidatePassword
                        .toString());
                    BlocProvider.of<ValidationSignUpCubit>(context)
                        .togglePasswordVisibility(
                            visibility:
                                BlocProvider.of<ValidationSignUpCubit>(context)
                                    .visibilityPassword);
                  },
                  icon: BlocProvider.of<ValidationSignUpCubit>(context)
                          .visibilityPassword
                      ? const Icon(Icons.visibility_off, color: Colors.blue)
                      : const Icon(Icons.visibility, color: Colors.blue),
                ),
          obscureText:
              BlocProvider.of<ValidationSignUpCubit>(context).visibilityPassword
                  ? true
                  : false,
          onChanged: (s) {
            BlocProvider.of<SignUpCubit>(context).password = s;
          },
          validator: (pass) {
            return BlocProvider.of<ValidationSignUpCubit>(context)
                .validatePassword(password: pass);
          },
        );
      },
    );
  }
}
/*
 confirmPassword: BlocProvider.of<SignUpCubit>(context).confirmPassword
 */
