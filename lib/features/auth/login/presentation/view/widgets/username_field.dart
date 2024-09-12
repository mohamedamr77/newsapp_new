import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/shared_widget/custom_form_field.dart';
import '../../../../../../core/utils/border_text_field.dart';
import '../../../../view_mdoel/auth_cubit/auth_cubit.dart';
import '../../../../view_mdoel/validation_cubit/auth_validation_cubit.dart';
import '../../../../view_mdoel/validation_cubit/auth_validation_state.dart';

class UsernameField extends StatelessWidget {
  const UsernameField({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthValidationCubit, AuthValidationState>(
      builder: (context, state) {
        return CustomFormField(
          border: BorderTextField.borderTextFormFieldAuth,
          enabledBorder: BorderTextField.enabledBorderTextFormFieldAuth,
          focusBorder: BorderTextField.focusedBorderTextFormFieldAuth,
          fillColor:
              BlocProvider.of<AuthValidationCubit>(context).isValidateUserNameLogin
                  ? const Color(0xffFFF3F8)
                  : Colors.white,
          hintText:
              BlocProvider.of<AuthValidationCubit>(context).isValidateUserNameLogin
                  ? "Input text"
                  : null,
          suffixIcon:
              BlocProvider.of<AuthValidationCubit>(context).isValidateUserNameLogin
                  ? const Icon(
                      Icons.close,
                      color: Colors.red,
                    )
                  : null,
          onChanged: (s) {
            BlocProvider.of<AuthCubit>(context).emailAddress = s;
          },
          validator: (value) {
            return BlocProvider.of<AuthValidationCubit>(context)
                .validateUserNameLogin(value);
          },
        );
      },
    );
  }
}
