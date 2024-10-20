import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsappcode/features/book_mark/presentation/view_model/book_mark_controller/book_mark_cubit.dart';

import '../../../../../core/shared_widget/loading_item.dart';
import '../../../../home_page/data/model/article_model.dart';
import '../../../../home_page/presentation/view/widgets/list_view_body.dart';
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
      bookmarksList: BlocProvider.of<BookMarkCubit>(context).bookMarkNewsList,
    );
  }

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<FetchTopicNewsCubit>(context);
    return BlocBuilder<FetchTopicNewsCubit, FetchTopicNewsState>(
      builder: (context, state) {
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
            child: ListView.separated(
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
          );
        } else {
          return const LoadingItem();
        }
      },
    );
  }
}
