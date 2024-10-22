import 'package:flutter/material.dart';

import '../../features/auth/login/presentation/view/login_view.dart';
import '../../features/auth/sign_up/presentation/view/sign_up_view.dart';
import '../../features/home_page/presentation/view/view.dart';
import '../../features/news_mark/presentation/view/news_mark_screen.dart';
import '../../features/search/presentation/view/search_view.dart';
import '../../features/topic_news/presentation/view/topic_news_view.dart';
import '../../features/topics/presentation/view/topics_view.dart';

class AppRouter {
  static Map<String, Widget Function(dynamic)> routes = {
    LoginScreen.id: (context) => const LoginScreen(),
    SignUpScreen.id: (context) => const SignUpScreen(),
    HomePageScreen.id: (context) => const HomePageScreen(),
    SearchView.id: (context) => const SearchView(),
    TopicNewsView.id: (context) => const TopicNewsView(),
    TopicsView.id: (context) => const TopicsView(),
    NewsMarkScreen.id: (context) => const NewsMarkScreen(),
  };
}
