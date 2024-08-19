import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../controller/login_cubit.dart';
import '../../controller/login_state.dart';

class CheckBoxButton extends StatelessWidget {
  const CheckBoxButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return Checkbox(
            value:
            BlocProvider.of<LoginCubit>(context).remember,
            onChanged: (value) {
              BlocProvider.of<LoginCubit>(context)
                  .toggleRememberMeValue(remember: value!);
            });
      },
    );
  }
}
