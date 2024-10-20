import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsappcode/features/book_mark/presentation/view_model/book_mark_controller/book_mark_state.dart';
import 'package:newsappcode/features/home_page/data/model/home_model.dart';

class BookMarkCubit extends Cubit<BookMarkState> {
  BookMarkCubit() : super(BookMarkInitialState());
  List<ArticlesModel> bookMarkNewsSet=[];
  
  void changeBookMarkForNewsItem(ArticlesModel news) {
     if (!bookMarkNewsSet.contains(news)) {
       bookMarkNewsSet.add(news);
       news.bookMark=!news.bookMark;
       debugPrint(bookMarkNewsSet.length.toString());
       emit(BookMarkAddNews());
     } else {
       bookMarkNewsSet.remove(news);
       news.bookMark=!news.bookMark;
       debugPrint(bookMarkNewsSet.length.toString());
       emit(BookMarkDeleteNews());
     }
  }
}
