import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:newsappcode/core/utils/box_app.dart';
import 'package:newsappcode/features/book_mark/presentation/view_model/book_mark_controller/book_mark_state.dart';
import 'package:newsappcode/features/home_page/data/model/article_model.dart';

class BookMarkCubit extends Cubit<BookMarkState> {
  BookMarkCubit() : super(BookMarkInitialState());
  List<ArticlesModel> bookMarkNewsList = [];
  var box = Hive.box<ArticlesModel>(BoxApp.newsBox);

  void changeBookMarkForNewsItem(ArticlesModel news) {

    if (!bookMarkNewsList.contains(news)) {
      addNewsItem(news);
    }
    else {
      removeNewsItem(news);
    }
  }

  addNewsItem(ArticlesModel news) async{
    news.bookMark = !news.bookMark;
    bookMarkNewsList.add(news);
    await box.put("${news.title}${news.publishedAt}", news);
    debugPrint(bookMarkNewsList.length.toString());
    emit(BookMarkAddNews());
  }

  removeNewsItem(ArticlesModel news) async{
    news.bookMark = !news.bookMark;
    bookMarkNewsList.remove(news);
    await box.delete("${news.title}${news.publishedAt}" );
    debugPrint(bookMarkNewsList.length.toString());
    emit(BookMarkDeleteNews());
  }

  fetchBookMarksFromHive(){
    bookMarkNewsList = box.values.toList();
  }
}
