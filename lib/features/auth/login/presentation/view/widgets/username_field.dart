import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsappcode/features/auth/login/presentation/controller/validation_cubit/login_validation_state.dart';

import '../../../../../../core/shared_widget/custom_form_field.dart';
import '../../../../../../core/utils/border_text_field.dart';
import '../../controller/login_cubit.dart';
import '../../controller/validation_cubit/login_validation_cubit.dart';

class UsernameField extends StatelessWidget {
  const UsernameField({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginValidationCubit, LoginValidationState>(
      builder: (context, state) {
        return CustomFormField(
          border: BorderTextField.borderTextFormFieldAuth,
          enabledBorder: BorderTextField.enabledBorderTextFormFieldAuth,
          focusBorder: BorderTextField.focusedBorderTextFormFieldAuth,
          fillColor:
              BlocProvider.of<LoginValidationCubit>(context).isValidateUserName
                  ? const Color(0xffFFF3F8)
                  : Colors.white,
          hintText:
              BlocProvider.of<LoginValidationCubit>(context).isValidateUserName
                  ? "Input text"
                  : null,
          suffixIcon:
              BlocProvider.of<LoginValidationCubit>(context).isValidateUserName
                  ? const Icon(
                      Icons.close,
                      color: Colors.red,
                    )
                  : null,
          onChanged: (s) {
            BlocProvider.of<LoginCubit>(context).emailAddress = s;
          },
          validator: (value) {
            return BlocProvider.of<LoginValidationCubit>(context)
                .validateUserName(value);
          },
        );
      },
    );
  }
}
