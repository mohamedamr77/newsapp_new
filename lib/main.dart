import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:newsappcode/core/api_service.dart';
import 'package:newsappcode/core/utils/box_app.dart';
import 'package:newsappcode/features/home_page/presentation/view/view.dart';
import 'package:newsappcode/features/topic_news/data/repo/topic_news_implement.dart';
import 'package:newsappcode/features/topic_news/presentation/view_model/fetch_topic_news/fetch_topic_news_cubit.dart';
import 'core/navigation/navigation_manager.dart';
import 'core/navigation/routes.dart';
import 'features/auth/login/presentation/view/login_view.dart';
import 'features/home_page/data/model/article_model.dart';
import 'features/home_page/data/model/source_model.dart';
import 'features/news_mark/presentation/view_model/news_mark_controller/news_mark_cubit.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Hive.initFlutter();
  Hive.registerAdapter(ArticlesModelAdapter());
  Hive.registerAdapter(SourceModelAdapter());

  await Hive.openBox<ArticlesModel>(BoxApp.newsBox);
  await Hive.openBox(BoxApp.userLoginBox);
  runApp(MultiBlocProvider(providers: [
    BlocProvider<FetchTopicNewsCubit>(
      create: (context) =>
          FetchTopicNewsCubit(TopicNewsImplement(ApiService(Dio()))),
    ),
    BlocProvider<NewsMarkCubit>(
      create: (context) => NewsMarkCubit(),
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
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          navigatorKey: NavigationManager.navigationKey,
          routes: AppRouter.routes,
          initialRoute: LoginScreen.id,
        );
      },
    );
  }
}
