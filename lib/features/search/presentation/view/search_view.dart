import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsappcode/core/api_service.dart';
import 'package:newsappcode/features/search/presentation/view/widgets/search_body.dart';
import '../../../../core/utils/color_app.dart';
import '../../data/repo/search_implement.dart';
import '../view_model/get_search_news/get_search_news_cubit.dart';

class SearchView extends StatelessWidget {
  static const String id = "/SearchView";
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          GetSearchNewsCubit(SearchImplement(ApiService(Dio()))),
      child: const Scaffold(
        backgroundColor: ColorApp.whiteColor,
        body: SearchBody(),
      ),
    );
  }
}
