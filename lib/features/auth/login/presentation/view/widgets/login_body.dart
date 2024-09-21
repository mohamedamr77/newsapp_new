import 'package:flutter/material.dart';
import 'body_form.dart';
import '../../../../shared_widget_auth/custom_top_view.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          fillOverscroll: true,
          hasScrollBody: false,
          child: ColumnWidget(),
        )
      ],
    );
  }
}
class ColumnWidget extends StatelessWidget {
  const ColumnWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.12095,
        ),
        CustomTopView(),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.04643628,
        ),
        Expanded(child: BodyForm())
      ],
    );
  }
}
