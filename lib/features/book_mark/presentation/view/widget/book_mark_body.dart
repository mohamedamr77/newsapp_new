import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsappcode/features/book_mark/presentation/view_model/book_mark_controller/book_mark_cubit.dart';
import 'package:newsappcode/features/book_mark/presentation/view_model/book_mark_controller/book_mark_state.dart';
import 'package:newsappcode/features/home_page/data/model/article_model.dart';

import '../../../../home_page/presentation/view/widgets/list_view_body.dart';
import '../../../../topic_news/presentation/view/widget/custom_app_bar_topic_news.dart';

class BookMarkBody extends StatelessWidget {
  const BookMarkBody({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<BookMarkCubit>(context);
    return SafeArea(
      child: Column(
        children: [
          SizedBox(height: 20.h,),
          const CustomAppBarTopicNews(
            topicName: "Book Mark",
            navigatePop: false,
          ),
          SizedBox(height: 30.h,),
          BlocBuilder<BookMarkCubit,BookMarkState>(builder: (context, state) {
            List<ArticlesModel> bookMarkNews = cubit.bookMarkNewsList.toSet().toList();
            if (bookMarkNews.isEmpty){
              return const Center(
                child: Text("No Bookmarked News"),
              );
            } else {
              return Expanded(
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    return ListViewBody(articlesModel: bookMarkNews[index]);
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: 12.h,
                    );
                  },
                  itemCount: bookMarkNews.length,
                ),
              );
            }
          },)

      
        ],
      ),
    );
  }
}
