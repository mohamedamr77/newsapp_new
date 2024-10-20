import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsappcode/features/home_page/data/model/article_model.dart';
import 'package:newsappcode/features/home_page/presentation/controller/get_general_news/get_general_news_cubit.dart';
import 'package:newsappcode/features/home_page/presentation/controller/get_general_news/get_general_news_state.dart';
import 'package:newsappcode/features/home_page/presentation/view/widgets/shimmer_item_list_news.dart';
import '../../../../book_mark/presentation/view_model/book_mark_controller/book_mark_cubit.dart';
import 'list_view_body.dart';

class ListViewNews extends StatefulWidget {
  const ListViewNews({super.key});

  @override
  State<ListViewNews> createState() => _ListViewNewsState();
}

class _ListViewNewsState extends State<ListViewNews> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<GetGeneralNewsCubit>(context).fetchGeneralNews(bookMarkList: BlocProvider.of<BookMarkCubit>(context).bookMarkNewsList);

  }
  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<GetGeneralNewsCubit>(context);
    return BlocBuilder<GetGeneralNewsCubit, GetGeneralNewsState>(
      builder: (BuildContext context, GetGeneralNewsState state) {
        List<ArticlesModel>? news = cubit.generalNewsMap["generalNews"];
        if (state is GetGeneralNewsLoadingState &&
            (news == null || news.isEmpty)) {
          return const ShimmerItemListNews();
        }

        if (state is GetGeneralNewsFaliureState) {
          return Text(
            state.errorMessage,
            style: const TextStyle(color: Colors.black),
          );
        }
        return SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
          return ListViewBody(
            articlesModel: news[index],
          );
        }, childCount: news!.length));
      },
    );
  }
}
