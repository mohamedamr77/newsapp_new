import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsappcode/features/home_page/data/model/home_model.dart';
import 'package:newsappcode/features/home_page/presentation/controller/get_general_news/get_general_news_cubit.dart';
import 'package:newsappcode/features/home_page/presentation/controller/get_general_news/get_general_news_state.dart';
import 'package:newsappcode/features/home_page/presentation/view/widgets/shimmer_item_list_news.dart';
import 'list_view_body.dart';

class ListViewNews extends StatelessWidget {
  const ListViewNews({super.key});

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
