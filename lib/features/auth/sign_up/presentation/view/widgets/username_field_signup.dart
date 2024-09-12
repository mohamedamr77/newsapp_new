import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/shared_widget/custom_form_field.dart';
import '../../../../../../core/utils/border_text_field.dart';
import '../../../../view_mdoel/auth_cubit/auth_cubit.dart';
import '../../../../view_mdoel/validation_cubit/auth_validation_cubit.dart';
import '../../../../view_mdoel/validation_cubit/auth_validation_state.dart';

class UsernameFieldSignup extends StatelessWidget {
  const UsernameFieldSignup({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthValidationCubit, AuthValidationState>(
      builder: (context, state) {
        return CustomFormField(
          border: BorderTextField.borderTextFormFieldAuth,
          enabledBorder: BorderTextField.enabledBorderTextFormFieldAuth,
          focusBorder: BorderTextField.focusedBorderTextFormFieldAuth,
          hintText:
              BlocProvider.of<AuthValidationCubit>(context).isValidateUserName
                  ? "Input UserName"
                  : null,
          suffixIcon:
              BlocProvider.of<AuthValidationCubit>(context).isValidateUserName
                  ? const Icon(
                      Icons.close,
                      color: Colors.red,
                    )
                  : null,
          onChanged: (s) {
            BlocProvider.of<AuthCubit>(context).emailAddress = s;
          },
          fillColor:
              BlocProvider.of<AuthValidationCubit>(context).isValidateUserName
                  ? const Color(0xffFFF3F8)
                  : Colors.white,
          validator: (v) {
            return BlocProvider.of<AuthValidationCubit>(context)
                .validateUserName(v);
          },
        );
      },
    );
  }
}
