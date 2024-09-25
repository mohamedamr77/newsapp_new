import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsappcode/features/home_page/presentation/controller/get_general_news/get_general_news_cubit.dart';
import 'package:newsappcode/features/home_page/presentation/controller/get_general_news/get_general_news_state.dart';
import 'package:newsappcode/features/home_page/presentation/view/widgets/list_view_body.dart';
import 'package:newsappcode/features/home_page/presentation/view/widgets/shimmer_item_list_news.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../core/shared_widget/build_shimmer_shape.dart';
import 'body_list_get_success_general_news.dart';

class ListViewNews extends StatelessWidget {
  const ListViewNews({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit= BlocProvider.of<GetGeneralNewsCubit>(context);
    debugPrint( cubit.generalNews.length.toString());
   return BlocConsumer<GetGeneralNewsCubit,GetGeneralNewsState>(
      builder: (BuildContext context, GetGeneralNewsState state) {
        if (state is GetGeneralNewsSuccessState){
          return  bodyGeneralNewsSuccessState(cubit: cubit);
        }
        return  const ShimmerItemListNews();
      },
      listener: (BuildContext context, GetGeneralNewsState state) {
      },
    );
  }
}