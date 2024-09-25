import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsappcode/features/home_page/presentation/controller/get_general_news/get_general_news_cubit.dart';
import 'package:newsappcode/features/home_page/presentation/controller/get_general_news/get_general_news_state.dart';
import 'package:newsappcode/features/home_page/presentation/view/widgets/list_view_body.dart';

class ListViewNews extends StatefulWidget {
  const ListViewNews({super.key});

  @override
  State<ListViewNews> createState() => _ListViewNewsState();
}

class _ListViewNewsState extends State<ListViewNews> {
  @override
  void initState(){
    super.initState();
    BlocProvider.of<GetGeneralNewsCubit>(context).fetchGeneralNews();
  }
  @override
  Widget build(BuildContext context) {
    var cubit= BlocProvider.of<GetGeneralNewsCubit>(context);
    debugPrint( cubit.generalNews.length.toString());
   return BlocConsumer<GetGeneralNewsCubit,GetGeneralNewsState>(
      builder: (BuildContext context, GetGeneralNewsState state) {
        if (state is GetGeneralNewsSuccessState){
          return  SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                return  ListViewBody(articlesModel: cubit.generalNews[index],);
              }, childCount: cubit.generalNews.length));
        }
        return const SliverToBoxAdapter(child: Center(child: CircularProgressIndicator()));
      },
      listener: (BuildContext context, GetGeneralNewsState state) {
   
      },
    );
  }
}
