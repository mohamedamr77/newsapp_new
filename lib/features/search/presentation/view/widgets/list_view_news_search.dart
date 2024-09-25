import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsappcode/features/home_page/presentation/view/widgets/list_view_body.dart';

import '../../view_model/get_search_news/get_search_news_cubit.dart';
import '../../view_model/get_search_news/get_search_news_state.dart';

class ListViewNewsSearch extends StatelessWidget {
  const ListViewNewsSearch({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<GetSearchNewsCubit>(context);
    return BlocBuilder<GetSearchNewsCubit, SearchNewsState>(
      builder: (context, state) {
        return Expanded(
          child: ListView.separated(
            itemBuilder: (context, index) {
              return ListViewBody(articlesModel: cubit.resultSearchList[index]);
            },
            separatorBuilder: (context, index) {
              return SizedBox(height: 12.h,);
            },
            itemCount: cubit.resultSearchList.length,
          ),
        );
      },
    );
  }
}
