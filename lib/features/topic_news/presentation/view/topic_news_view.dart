import 'package:flutter/material.dart';
import 'package:newsappcode/core/utils/color_app.dart';
import 'package:newsappcode/features/topic_news/presentation/view/widget/topic_news_body.dart';

class TopicNewsView extends StatelessWidget {
  const TopicNewsView(
      {super.key, required this.topicName, required this.index});
  final String topicName;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorApp.whiteColor,
      body: TopicNewsBody(
        topicName: topicName,
        index: index,
      ),
    );
  }
}
