import 'package:flutter/material.dart';
import 'package:newsappcode/core/utils/color_app.dart';
import 'package:newsappcode/features/topics/presentation/view/widgets/topics_body.dart';

class TopicsView extends StatelessWidget {
  static const String id = "/TopicsView";
  const TopicsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: ColorApp.whiteColor,
      body: TopicsBody(),
    );
  }
}
