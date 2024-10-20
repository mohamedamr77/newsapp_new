import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:newsappcode/core/utils/box_app.dart';
import 'package:newsappcode/features/home_page/data/model/article_model.dart';

import 'book_mark_state.dart';

class NewsMarkCubit extends Cubit<NewsMarkState> {
  NewsMarkCubit() : super(NewsMarkInitialState());
  List<ArticlesModel> newsMarkNewsList = [];
  var box = Hive.box<ArticlesModel>(BoxApp.newsBox);

  void changeNewsMarkForNewsItem(ArticlesModel news) {
    if (!newsMarkNewsList.contains(news)) {
      addNewsItem(news);
    } else {
      removeNewsItem(news);
    }
  }

  addNewsItem(ArticlesModel news) async {
    news.newsMark = !news.newsMark;
    newsMarkNewsList.add(news);
    await box.put("${news.title}${news.publishedAt}", news);
    debugPrint(newsMarkNewsList.length.toString());
    emit(NewsMarkAddNews());
  }

  removeNewsItem(ArticlesModel news) async {
    news.newsMark = !news.newsMark;
    newsMarkNewsList.remove(news);
    await box.delete("${news.title}${news.publishedAt}");
    debugPrint(newsMarkNewsList.length.toString());
    emit(NewsMarkDeleteNews());
  }

  fetchNewsMarksFromHive() {
    newsMarkNewsList = box.values.toList();
  }
}
