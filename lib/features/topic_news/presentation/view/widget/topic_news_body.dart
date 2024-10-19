import 'package:flutter/material.dart';
import 'package:newsappcode/features/topic_news/presentation/view/widget/list_news_topic_news.dart';
import 'custom_app_bar_topic_news.dart';

class TopicNewsBody extends StatelessWidget {
  const TopicNewsBody(
      {super.key, required this.topicName, required this.index});
  final String topicName;
  final int index;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          CustomAppBarTopicNews(
            topicName: topicName,
            index: index,
          ),
          ListNewsTopicNews(topicName: topicName, index: index),
        ],
      ),
    );
  }
}
