import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsappcode/features/book_mark/presentation/view_model/book_mark_controller/book_mark_state.dart';

class BookMarkCubit extends Cubit<BookMarkState> {
  BookMarkCubit() : super(BookMarkInitialState());
}
