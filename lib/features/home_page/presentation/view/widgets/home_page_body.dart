import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsappcode/core/api_service.dart';
import 'package:newsappcode/features/home_page/data/repo/home_implement.dart';
import 'package:newsappcode/features/home_page/presentation/view/widgets/list_view_news.dart';
import '../../controller/get_general_news/get_general_news_cubit.dart';
import 'custom_sliver_appbar.dart';

class HomePageBody extends StatelessWidget {
  const HomePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: BlocProvider(
        create: (context) => GetGeneralNewsCubit(HomeImplement(ApiService(
          Dio()
        )
        )
        ),
        child: CustomScrollView(
          slivers: [
            CustomSliverAppbar(),
            ListViewNews(),
          ],
        ),
      ),
    );
  }
}
