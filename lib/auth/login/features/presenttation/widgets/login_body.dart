import 'package:flutter/material.dart';
import 'body_form.dart';
import 'custom_top_view.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff0F8ACF),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.12095,
            ),
          ),
          const SliverToBoxAdapter(
            child: CustomTopView(),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.04643628,
            ),
          ),
          const SliverToBoxAdapter(
            child: BodyForm(),
          )
        ],
      ),
    );
  }
}
