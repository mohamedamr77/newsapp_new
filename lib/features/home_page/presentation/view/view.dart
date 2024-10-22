import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:newsappcode/features/home_page/presentation/view/widgets/home_page_body.dart';

import '../../../../core/api_service.dart';
import '../../../news_mark/presentation/view/news_mark_screen.dart';
import '../../../news_mark/presentation/view_model/news_mark_controller/news_mark_cubit.dart';
import '../../../topics/presentation/view/topics_view.dart';
import '../../data/repo/home_implement.dart';
import '../controller/get_general_news/get_general_news_cubit.dart';

class HomePageScreen extends StatefulWidget {
  static const String id = "/HomePageScreen";
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  int currentIndex = 0;
  List<Widget> displayScreen = [
    const HomePageBody(),
    const TopicsView(),
    const NewsMarkScreen(),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<NewsMarkCubit>(context).fetchNewsMarksFromHive();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          GetGeneralNewsCubit(HomeImplement(ApiService(Dio()))),
      child: Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          showUnselectedLabels: true,
          currentIndex: currentIndex,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_filled),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.topic_outlined),
              label: "topics",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.bookmark_border),
              label: "News Mark",
            ),
          ],
        ),
        body: displayScreen[currentIndex],
      ),
    );
  }
}
