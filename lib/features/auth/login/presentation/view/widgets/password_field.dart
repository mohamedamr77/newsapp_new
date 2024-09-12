import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsappcode/core/utils/border_text_field.dart';

import '../../../../../../core/shared_widget/custom_form_field.dart';
import '../../../../view_mdoel/validation_cubit/auth_validation_cubit.dart';
import '../../../../view_mdoel/validation_cubit/auth_validation_state.dart';
import '../../../../view_mdoel/auth_cubit/auth_cubit.dart';

class PasswordField extends StatelessWidget {
  const PasswordField({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthValidationCubit, AuthValidationState>(
      builder: (context, state) {
        return CustomFormField(
          border: BorderTextField.borderTextFormFieldAuth,
          enabledBorder: BorderTextField.enabledBorderTextFormFieldAuth,
          focusBorder: BorderTextField.focusedBorderTextFormFieldAuth,
          fillColor:
              BlocProvider.of<AuthValidationCubit>(context).isValidatePasswordLogin
                  ? const Color(0xffFFF3F8)
                  : Colors.white,
          hintText:
              BlocProvider.of<AuthValidationCubit>(context).isValidatePasswordLogin
                  ? "Input Password"
                  : null,
          onChanged: (s) {
            BlocProvider.of<AuthCubit>(context).password = s;
          },
          validator: (v) {
            return BlocProvider.of<AuthValidationCubit>(context)
                .validatePasswordLogin(v);
          },
          suffixIcon: BlocProvider.of<AuthValidationCubit>(context)
                  .isValidatePasswordLogin
              ? const Icon(
                  Icons.close,
                  color: Colors.red,
                )
              : IconButton(
                  icon: BlocProvider.of<AuthValidationCubit>(context).visibility
                      ? const Icon(
                          Icons.visibility_off,
                          color: Color(0xff0F8ACF),
                        )
                      : const Icon(
                          Icons.remove_red_eye,
                          color: Color(0xff0F8ACF),
                        ),
                  onPressed: () {
                    BlocProvider.of<AuthValidationCubit>(context).visibility =
                        !BlocProvider.of<AuthValidationCubit>(context)
                            .visibility;
                    debugPrint(
                        "${BlocProvider.of<AuthValidationCubit>(context).visibility}");
                    BlocProvider.of<AuthValidationCubit>(context)
                        .togglePasswordVisibility(
                            visibility:
                                BlocProvider.of<AuthValidationCubit>(context)
                                    .visibility);
                  },
                ),
          obscureText: BlocProvider.of<AuthValidationCubit>(context).visibility
              ? true
              : false,
        );
      },
    );
  }
}
