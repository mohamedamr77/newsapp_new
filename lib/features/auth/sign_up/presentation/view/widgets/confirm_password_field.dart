import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/shared_widget/custom_form_field.dart';
import '../../controller/sign_up_cubit.dart';
import '../../controller/sign_up_state.dart';
import '../../controller/validation_cubit/validation_sign_up_cubit.dart';

class ConfirmPasswordField extends StatelessWidget {
  const ConfirmPasswordField({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      builder: (context, state) {
        return CustomFormField(
          suffixIcon: BlocProvider.of<ValidationSignUpCubit>(context)
                  .isValidateConfirmPassword
              ? const Icon(
                  Icons.close,
                  color: Colors.red,
                )
              : IconButton(
                  onPressed: () {
                    // BlocProvider.of<SignUpCubit>(context).visibilityConfirmPassword=!BlocProvider.of<SignUpCubit>(context).visibilityConfirmPassword;
                    BlocProvider.of<SignUpCubit>(context)
                        .toggleConfirmPasswordVisibility(
                            visibility: BlocProvider.of<SignUpCubit>(context)
                                .visibilityConfirmPassword);
                  },
                  icon: BlocProvider.of<SignUpCubit>(context)
                          .visibilityConfirmPassword
                      ? const Icon(Icons.visibility_off, color: Colors.blue)
                      : const Icon(Icons.visibility, color: Colors.blue),
                ),
          obscureText:
              BlocProvider.of<SignUpCubit>(context).visibilityConfirmPassword
                  ? true
                  : false,
          fillColor:
              BlocProvider.of<ValidationSignUpCubit>(context).isValidateConfirmPassword
                  ? const Color(0xffFFF3F8)
                  : Colors.white,
          hintText:
              BlocProvider.of<ValidationSignUpCubit>(context).isValidateConfirmPassword
                  ? "Input Password"
                  : null,
          validator: (v) {
            return BlocProvider.of<ValidationSignUpCubit>(context)
                .validateConfirmPassword(v);
          },
          onSaved: (s) {
            BlocProvider.of<SignUpCubit>(context).confirmPassword=s;
          },

        );
      },
    );
  }
}
