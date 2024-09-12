import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsappcode/features/auth/view_mdoel/validation_cubit/auth_validation_state.dart';

import '../../../../../../core/shared_widget/custom_form_field.dart';
import '../../../../../../core/utils/border_text_field.dart';
import '../../../../view_mdoel/auth_cubit/auth_cubit.dart';
import '../../../../view_mdoel/validation_cubit/auth_validation_cubit.dart';

class PasswordFieldSignUp extends StatelessWidget {
  const PasswordFieldSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthValidationCubit, AuthValidationState>(
      builder: (context, state) {
        return CustomFormField(
          border: BorderTextField.borderTextFormFieldAuth,
          enabledBorder: BorderTextField.enabledBorderTextFormFieldAuth,
          focusBorder: BorderTextField.focusedBorderTextFormFieldAuth,
          fillColor:
              BlocProvider.of<AuthValidationCubit>(context).isValidatePassword
                  ? const Color(0xffFFF3F8)
                  : Colors.white,
          hintText:
              BlocProvider.of<AuthValidationCubit>(context).isValidatePassword
                  ? "Input Password"
                  : null,
          suffixIcon: BlocProvider.of<AuthValidationCubit>(context)
                  .isValidatePassword
              ? const Icon(
                  Icons.close,
                  color: Colors.red,
                )
              : IconButton(
                  onPressed: () {
                    log(BlocProvider.of<AuthValidationCubit>(context)
                        .isValidatePassword
                        .toString());
                    BlocProvider.of<AuthValidationCubit>(context)
                        .togglePasswordVisibility(
                            visibility:
                                BlocProvider.of<AuthValidationCubit>(context)
                                    .visibilityPassword);
                  },
                  icon: BlocProvider.of<AuthValidationCubit>(context)
                          .visibilityPassword
                      ? const Icon(Icons.visibility_off, color: Colors.blue)
                      : const Icon(Icons.visibility, color: Colors.blue),
                ),
          obscureText:
              BlocProvider.of<AuthValidationCubit>(context).visibilityPassword
                  ? true
                  : false,
          onChanged: (s) {
            BlocProvider.of<AuthCubit>(context).password = s;
          },
          validator: (pass) {
            return BlocProvider.of<AuthValidationCubit>(context)
                .validatePassword(pass);
          },
        );
      },
    );
  }
}
/*
 confirmPassword: BlocProvider.of<AuthCubit>(context).confirmPassword
 */
