import 'package:flutter/material.dart';
import 'package:newsappcode/features/topics/presentation/view/widgets/topics_body.dart';

class TopicsView extends StatelessWidget {
  const TopicsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: TopicsBody(),
    );
  }
}
