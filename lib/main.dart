import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsappcode/core/api_service.dart';
import 'package:newsappcode/features/home_page/presentation/view/view.dart';
import 'package:newsappcode/features/topic_news/data/repo/topic_news_implement.dart';
import 'package:newsappcode/features/topic_news/presentation/view_model/fetch_topic_news/fetch_topic_news_cubit.dart';
import 'features/book_mark/presentation/view_model/book_mark_controller/book_mark_cubit.dart';
import 'features/home_page/data/repo/home_implement.dart';
import 'features/home_page/presentation/controller/get_general_news/get_general_news_cubit.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MultiBlocProvider(providers: [
    BlocProvider<FetchTopicNewsCubit>(
      create: (context) =>
          FetchTopicNewsCubit(TopicNewsImplement(ApiService(Dio()))),
    ),
    BlocProvider<BookMarkCubit>(
      create: (context) =>
      BookMarkCubit(),
    ),
    BlocProvider<GetGeneralNewsCubit>(
      create: (context) => GetGeneralNewsCubit(HomeImplement(ApiService(Dio())))
        ..fetchGeneralNews(),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: HomePageScreen(),
        );
      },
    );
  }
}
