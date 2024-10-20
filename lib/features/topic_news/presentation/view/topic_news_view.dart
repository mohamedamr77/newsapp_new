import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsappcode/core/utils/color_app.dart';
import 'package:newsappcode/features/topic_news/presentation/view/widget/topic_news_body.dart';
import '../view_model/fetch_topic_news/fetch_top_news_state.dart';
import '../view_model/fetch_topic_news/fetch_topic_news_cubit.dart';

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
