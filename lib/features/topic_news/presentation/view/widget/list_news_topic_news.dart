import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/shared_widget/loading_item.dart';
import '../../../../home_page/data/model/article_model.dart';
import '../../../../home_page/presentation/view/widgets/list_view_body.dart';
import '../../../../news_mark/presentation/view_model/news_mark_controller/news_mark_cubit.dart';
import '../../view_model/fetch_topic_news/fetch_top_news_state.dart';
import '../../view_model/fetch_topic_news/fetch_topic_news_cubit.dart';

class ListNewsTopicNews extends StatefulWidget {
  const ListNewsTopicNews(
      {super.key, required this.topicName, required this.index});
  final String topicName;
  final int index;
  @override
  State<ListNewsTopicNews> createState() => _ListNewsTopicNewsState();
}

class _ListNewsTopicNewsState extends State<ListNewsTopicNews> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<FetchTopicNewsCubit>(context).fetchTopicNewsCubit(
      topic: widget.topicName,
      index: widget.index,
      newsMarksList: BlocProvider.of<NewsMarkCubit>(context).newsMarkNewsList,
    );
  }

  FetchTopicNewsCubit? _fetchTopicNewsCubit;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Store the reference to the FetchTopicNewsCubit safely
    _fetchTopicNewsCubit = BlocProvider.of<FetchTopicNewsCubit>(context);
  }

  @override
  void dispose() {
    // Use the stored reference
    _fetchTopicNewsCubit?.pageNumbers[widget.index] = 1;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<FetchTopicNewsCubit>(context);
    return BlocBuilder<FetchTopicNewsCubit, FetchTopicNewsState>(
      buildWhen: (previous, current) =>
          current is! FetchTopicNewsPaginationLoadingState &&
          current is! FetchTopicNewsPaginationFailedState,
      builder: (context, state) {
        if (kDebugMode) {
          print(state.runtimeType);
        }
        List<ArticlesModel>? topicsList = cubit.topicNewsMap[widget.index];

        if (state is FetchTopicNewsLoadingState &&
            (topicsList == null || topicsList.isEmpty)) {
          return const LoadingItem();
        } else if (state is FetchTopicNewsFaliureState) {
          return Text(
              "An error occurred while fetching data ${state.errorMessage}");
        } else if (state is FetchTopicNewsSuccessState &&
            topicsList != null &&
            topicsList.isNotEmpty) {
          return Expanded(
            child: NotificationListener<ScrollNotification>(
              onNotification: (notification) {
                if (notification.metrics.pixels ==
                        notification.metrics.maxScrollExtent &&
                    notification is ScrollUpdateNotification) {
                  debugPrint("Loading");
                  cubit.fetchTopicNewsCubit(
                    topic: widget.topicName,
                    index: widget.index,
                    newsMarksList: BlocProvider.of<NewsMarkCubit>(context)
                        .newsMarkNewsList,
                    isLoadingMore: true,
                  );
                }
                return true;
              },
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return ListViewBody(articlesModel: topicsList[index]);
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: 12.h,
                  );
                },
                itemCount: topicsList.length,
              ),
            ),
          );
        } else if ((topicsList == null || topicsList.isEmpty)) {
          return const CircularProgressIndicator();
        } else {
          return Expanded(
            child: NotificationListener<ScrollNotification>(
              onNotification: (notification) {
                if (notification.metrics.pixels ==
                        notification.metrics.maxScrollExtent &&
                    notification is ScrollUpdateNotification) {
                  debugPrint("Loading");
                  cubit.fetchTopicNewsCubit(
                    topic: widget.topicName,
                    index: widget.index,
                    newsMarksList: BlocProvider.of<NewsMarkCubit>(context)
                        .newsMarkNewsList,
                    isLoadingMore: true,
                  );
                }
                return true;
              },
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return ListViewBody(articlesModel: topicsList[index]);
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: 12.h,
                  );
                },
                itemCount: topicsList.length,
              ),
            ),
          );
        }
      },
    );
  }
}
