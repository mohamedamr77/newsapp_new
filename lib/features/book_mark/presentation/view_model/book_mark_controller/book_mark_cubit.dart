import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsappcode/features/book_mark/presentation/view_model/book_mark_controller/book_mark_state.dart';
import 'package:newsappcode/features/home_page/data/model/article_model.dart';

class BookMarkCubit extends Cubit<BookMarkState> {
  BookMarkCubit() : super(BookMarkInitialState());
  List<ArticlesModel> bookMarkNewsList=[];
  
  void changeBookMarkForNewsItem(ArticlesModel news) {
     if (!bookMarkNewsList.contains(news)) {
       bookMarkNewsList.add(news);
       news.bookMark=!news.bookMark;
       debugPrint(bookMarkNewsList.length.toString());
       emit(BookMarkAddNews());
     } else {
       bookMarkNewsList.remove(news);
       news.bookMark=!news.bookMark;
       debugPrint(bookMarkNewsList.length.toString());
       emit(BookMarkDeleteNews());
     }
  }
}
