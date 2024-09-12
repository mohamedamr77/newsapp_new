import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/shared_widget/custom_form_field.dart';
import '../../../../../../core/utils/border_text_field.dart';
import '../../../../view_mdoel/auth_cubit/auth_cubit.dart';
import '../../../../view_mdoel/validation_cubit/auth_validation_cubit.dart';
import '../../../../view_mdoel/validation_cubit/auth_validation_state.dart';

class ConfirmPasswordField extends StatelessWidget {
  const ConfirmPasswordField({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthValidationCubit, AuthValidationState>(
      builder: (context, state) {
        return CustomFormField(
          border: BorderTextField.borderTextFormFieldAuth,
          enabledBorder: BorderTextField.enabledBorderTextFormFieldAuth,
          focusBorder: BorderTextField.focusedBorderTextFormFieldAuth,
          suffixIcon: BlocProvider.of<AuthValidationCubit>(context)
                  .isValidateConfirmPassword
              ? const Icon(
                  Icons.close,
                  color: Colors.red,
                )
              : IconButton(
                  onPressed: () {
                    log(BlocProvider.of<AuthValidationCubit>(context)
                        .visibilityConfirmPassword
                        .toString());
                    BlocProvider.of<AuthValidationCubit>(context)
                        .toggleConfirmPasswordVisibility(
                            visibility:
                                BlocProvider.of<AuthValidationCubit>(context)
                                    .visibilityConfirmPassword);
                  },
                  icon: BlocProvider.of<AuthValidationCubit>(context)
                          .visibilityConfirmPassword
                      ? const Icon(Icons.visibility_off, color: Colors.blue)
                      : const Icon(Icons.visibility, color: Colors.blue),
                ),
          obscureText: BlocProvider.of<AuthValidationCubit>(context)
                  .visibilityConfirmPassword
              ? true
              : false,
          fillColor: BlocProvider.of<AuthValidationCubit>(context)
                  .isValidateConfirmPassword
              ? const Color(0xffFFF3F8)
              : Colors.white,
          hintText: BlocProvider.of<AuthValidationCubit>(context)
                  .isValidateConfirmPassword
              ? "Input Password"
              : null,
          validator: (confirmPass) {
            return BlocProvider.of<AuthValidationCubit>(context)
                .validateConfirmPassword(
                    password: BlocProvider.of<AuthCubit>(context).password,
                    confirmPassword: confirmPass);
          },
          onChanged: (s) {
            BlocProvider.of<AuthCubit>(context).confirmPassword = s;
          },
        );
      },
    );
  }
}
