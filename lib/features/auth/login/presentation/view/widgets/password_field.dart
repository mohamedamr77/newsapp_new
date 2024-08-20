import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/shared_widget/custom_form_field.dart';
import '../../controller/login_cubit.dart';
import '../../controller/login_state.dart';

class PasswordField extends StatelessWidget {
  const PasswordField({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return CustomFormField(
          fillColor: BlocProvider.of<LoginCubit>(context).isValidatePassword
              ? const Color(0xffFFF3F8)
              : Colors.white,
          hintText: BlocProvider.of<LoginCubit>(context).isValidatePassword
              ? "Input Password"
              : null,
          onSaved: (s) {
            BlocProvider.of<LoginCubit>(context).password=s;
          },
          validator: (v) {
            return BlocProvider.of<LoginCubit>(context).validatePassword(v);
          },
          suffixIcon: BlocProvider.of<LoginCubit>(context).isValidatePassword
              ? const Icon(
                  Icons.close,
                  color: Colors.red,
                )
              : IconButton(
                  icon: BlocProvider.of<LoginCubit>(context).visibility
                      ? const Icon(
                          Icons.visibility_off,
                          color: Color(0xff0F8ACF),
                        )
                      : const Icon(
                          Icons.remove_red_eye,
                          color: Color(0xff0F8ACF),
                        ),
                  onPressed: () {
                    BlocProvider.of<LoginCubit>(context).visibility =
                        !BlocProvider.of<LoginCubit>(context).visibility;
                    debugPrint(
                        "${BlocProvider.of<LoginCubit>(context).visibility}");
                    BlocProvider.of<LoginCubit>(context)
                        .togglePasswordVisibility(
                            visibility: BlocProvider.of<LoginCubit>(context)
                                .visibility);
                  },
                ),
          obscureText:
              BlocProvider.of<LoginCubit>(context).visibility ? true : false,
        );
      },
    );
  }
}
