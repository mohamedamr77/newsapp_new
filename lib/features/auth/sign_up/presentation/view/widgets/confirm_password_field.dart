import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsappcode/features/auth/sign_up/presentation/controller/validation_cubit/validation_sign_up_state.dart';
import '../../../../../../core/shared_widget/custom_form_field.dart';
import '../../../../../../core/utils/border_text_field.dart';
import '../../controller/sign_up_cubit.dart';
import '../../controller/validation_cubit/validation_sign_up_cubit.dart';

class ConfirmPasswordField extends StatelessWidget {
  const ConfirmPasswordField({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ValidationSignUpCubit, ValidationSignUpState>(
      builder: (context, state) {
        return CustomFormField(
          border: BorderTextField.borderTextFormFieldAuth,
          enabledBorder: BorderTextField.enabledBorderTextFormFieldAuth,
          focusBorder: BorderTextField.focusedBorderTextFormFieldAuth,
          suffixIcon: BlocProvider.of<ValidationSignUpCubit>(context)
                  .isValidateConfirmPassword
              ? const Icon(
                  Icons.close,
                  color: Colors.red,
                )
              : IconButton(
                  onPressed: () {
                    log(BlocProvider.of<ValidationSignUpCubit>(context)
                        .visibilityConfirmPassword
                        .toString());
                    BlocProvider.of<ValidationSignUpCubit>(context)
                        .toggleConfirmPasswordVisibility(
                            visibility:
                                BlocProvider.of<ValidationSignUpCubit>(context)
                                    .visibilityConfirmPassword);
                  },
                  icon: BlocProvider.of<ValidationSignUpCubit>(context)
                          .visibilityConfirmPassword
                      ? const Icon(Icons.visibility_off, color: Colors.blue)
                      : const Icon(Icons.visibility, color: Colors.blue),
                ),
          obscureText: BlocProvider.of<ValidationSignUpCubit>(context)
                  .visibilityConfirmPassword
              ? true
              : false,
          fillColor: BlocProvider.of<ValidationSignUpCubit>(context)
                  .isValidateConfirmPassword
              ? const Color(0xffFFF3F8)
              : Colors.white,
          hintText: BlocProvider.of<ValidationSignUpCubit>(context)
                  .isValidateConfirmPassword
              ? "Input Password"
              : null,
          validator: (confirmPass) {
            return BlocProvider.of<ValidationSignUpCubit>(context)
                .validateConfirmPassword(password: BlocProvider.of<SignUpCubit>(context).password , confirmPassword: confirmPass);
          },
          onChanged: (s) {
            BlocProvider.of<SignUpCubit>(context).confirmPassword = s;
          },
        );
      },
    );
  }
}
