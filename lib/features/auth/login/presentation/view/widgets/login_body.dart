import 'package:flutter/material.dart';
import 'body_form.dart';
import '../../../../shared_widget_auth/custom_top_view.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.12095,
          ),
          const CustomTopView(),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.04643628,
          ),
          const BodyForm()
        ],
      ),
    );
  }
}
