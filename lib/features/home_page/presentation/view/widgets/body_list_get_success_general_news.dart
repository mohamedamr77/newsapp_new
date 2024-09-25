import 'package:flutter/material.dart';

import 'list_view_body.dart';

Widget bodyGeneralNewsSuccessState({required cubit}) {
  return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
    return ListViewBody(
      articlesModel: cubit.generalNews[index],
    );
  }, childCount: cubit.generalNews.length));
}
