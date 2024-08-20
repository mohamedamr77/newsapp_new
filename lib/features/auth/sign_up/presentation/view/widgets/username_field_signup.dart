import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsappcode/features/auth/sign_up/presentation/controller/validation_cubit/validation_sign_up_state.dart';

import '../../../../../../core/shared_widget/custom_form_field.dart';
import '../../controller/sign_up_cubit.dart';
import '../../controller/validation_cubit/validation_sign_up_cubit.dart';

class UsernameFieldSignup extends StatelessWidget {
  const UsernameFieldSignup({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ValidationSignUpCubit, ValidationSignUpState>(
      builder: (context, state) {
        return CustomFormField(
          hintText:
              BlocProvider.of<ValidationSignUpCubit>(context).isValidateUserName
                  ? "Input UserName"
                  : null,
          suffixIcon:
              BlocProvider.of<ValidationSignUpCubit>(context).isValidateUserName
                  ? const Icon(
                      Icons.close,
                      color: Colors.red,
                    )
                  : null,
          onSaved: (s) {
            BlocProvider.of<SignUpCubit>(context).emailAddress = s;
          },
          fillColor:
              BlocProvider.of<ValidationSignUpCubit>(context).isValidateUserName
                  ? const Color(0xffFFF3F8)
                  : Colors.white,
          validator: (v) {
            return BlocProvider.of<ValidationSignUpCubit>(context)
                .validateUserName(v);
          },
        );
      },
    );
  }
}
