import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:newsappcode/core/utils/color_app.dart';
import 'package:newsappcode/features/topic_news/presentation/view/widget/topic_news_body.dart';
import '../view_model/fetch_topic_news/fetch_top_news_state.dart';
import '../view_model/fetch_topic_news/fetch_topic_news_cubit.dart';

class TopicNewsView extends StatelessWidget {
  static const String id = "/TopicNewsView";
  const TopicNewsView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    final topicName = args['topicName'] as String;
    final index = args['index'] as int;

    return Scaffold(
      backgroundColor: ColorApp.whiteColor,
      body: TopicNewsBody(
        topicName: topicName,
        index: index,
      ),
      bottomSheet: SizedBox(
        height: 70,
        child: BlocConsumer<FetchTopicNewsCubit, FetchTopicNewsState>(
          buildWhen: (previous, current) =>
              current is FetchTopicNewsPaginationLoadingState ||
              current is FetchTopicNewsPaginationFailedState ||
              current is FetchTopicNewsSuccessState,
          builder: (context, state) {
            if (state is FetchTopicNewsPaginationLoadingState) {
              return Container(
                height: 70,
                color: ColorApp.whiteColor,
                child: const Center(
                  child: CircularProgressIndicator(
                    color: ColorApp.primaryColor,
                  ),
                ),
              );
            } else {
              return const SizedBox.shrink();
            }
          },
          listener: (context, state) {
            if (state is FetchTopicNewsPaginationFailedState) {
              Fluttertoast.showToast(
                  msg: "All Items Fetch Failed",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 16.0);
            }
          },
        ),
      ),
    );
  }
}
