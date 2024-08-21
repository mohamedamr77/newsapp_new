import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsappcode/features/auth/login/presentation/controller/validation_cubit/login_validation_state.dart';

import '../../../../../../core/shared_widget/custom_form_field.dart';
import '../../controller/login_cubit.dart';
import '../../controller/validation_cubit/login_validation_cubit.dart';

class PasswordField extends StatelessWidget {
  const PasswordField({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginValidationCubit, LoginValidationState>(
      builder: (context, state) {
        return CustomFormField(
          fillColor: BlocProvider.of<LoginValidationCubit>(context).isValidatePassword
              ? const Color(0xffFFF3F8)
              : Colors.white,
          hintText: BlocProvider.of<LoginValidationCubit>(context).isValidatePassword
              ? "Input Password"
              : null,
          onSaved: (s) {
            BlocProvider.of<LoginCubit>(context).password = s;
          },
          validator: (v) {
            return BlocProvider.of<LoginValidationCubit>(context).validatePassword(v);
          },
          suffixIcon: BlocProvider.of<LoginValidationCubit>(context).isValidatePassword
              ? const Icon(
                  Icons.close,
                  color: Colors.red,
                )
              : IconButton(
                  icon: BlocProvider.of<LoginValidationCubit>(context).visibility
                      ? const Icon(
                          Icons.visibility_off,
                          color: Color(0xff0F8ACF),
                        )
                      : const Icon(
                          Icons.remove_red_eye,
                          color: Color(0xff0F8ACF),
                        ),
                  onPressed: () {
                    BlocProvider.of<LoginValidationCubit>(context).visibility =
                        !BlocProvider.of<LoginValidationCubit>(context).visibility;
                    debugPrint(
                        "${BlocProvider.of<LoginValidationCubit>(context).visibility}");
                    BlocProvider.of<LoginValidationCubit>(context)
                        .togglePasswordVisibility(
                            visibility: BlocProvider.of<LoginValidationCubit>(context)
                                .visibility);
                  },
                ),
          obscureText:
              BlocProvider.of<LoginValidationCubit>(context).visibility ? true : false,
        );
      },
    );
  }
}
