import 'package:flutter/material.dart';
import 'package:newsappcode/features/home_page/presentation/view/widgets/home_page_body.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: HomePageBody(),
    );
  }
}
