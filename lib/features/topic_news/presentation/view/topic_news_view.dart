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
      bottomSheet: SizedBox(
        height: 70,
        child: BlocBuilder<FetchTopicNewsCubit, FetchTopicNewsState>(
          buildWhen: (previous, current) =>
              current is FetchTopicNewsPaginationLoadingState ||
              current is FetchTopicNewsPaginationLoadingState ||
              current is FetchTopicNewsSuccessState,
          builder: (context, state) {
            if (state is FetchTopicNewsPaginationLoadingState) {
              return Container(
                height: 70,
                color: ColorApp.whiteColor,
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              );
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
}
