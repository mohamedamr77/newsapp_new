import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:newsappcode/features/home_page/data/model/article_model.dart';

import '../../../../home_page/presentation/view/widgets/list_view_body.dart';
import '../../../../topic_news/presentation/view/widget/custom_app_bar_topic_news.dart';
import '../../view_model/news_mark_controller/book_mark_state.dart';
import '../../view_model/news_mark_controller/news_mark_cubit.dart';

class NewsMarkBody extends StatelessWidget {
  const NewsMarkBody({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<NewsMarkCubit>(context);
    return SafeArea(
      child: Column(
        children: [
          SizedBox(
            height: 20.h,
          ),
          const CustomAppBarTopicNews(
            topicName: "News Mark",
            navigatePop: false,
          ),
          SizedBox(
            height: 30.h,
          ),
          BlocBuilder<NewsMarkCubit, NewsMarkState>(
            builder: (context, state) {
              List<ArticlesModel> newsMarkNews =
                  cubit.newsMarkNewsList.toSet().toList();
              if (newsMarkNews.isEmpty) {
                return const Center(
                  child: Text("No NewsMarked News"),
                );
              } else {
                return Expanded(
                  child: ListView.separated(
                    itemBuilder: (context, index) {
                      return ListViewBody(articlesModel: newsMarkNews[index]);
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        height: 12.h,
                      );
                    },
                    itemCount: newsMarkNews.length,
                  ),
                );
              }
            },
          )
        ],
      ),
    );
  }
}
