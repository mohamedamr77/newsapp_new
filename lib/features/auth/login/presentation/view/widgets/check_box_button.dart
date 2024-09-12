import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../view_mdoel/auth_cubit/auth_cubit.dart';
import '../../../../view_mdoel/auth_cubit/auth_state.dart';

class CheckBoxButton extends StatelessWidget {
  const CheckBoxButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        return Checkbox(
            value: BlocProvider.of<AuthCubit>(context).remember,
            onChanged: (value) {
              BlocProvider.of<AuthCubit>(context)
                  .toggleRememberMeValue(remember: value!);
            });
      },
    );
  }
}
