import 'package:flutter_bloc/flutter_bloc.dart';

import 'get_search_news_state.dart';

class GetSearchNewsCubit extends Cubit<SearchNewsState> {
  GetSearchNewsCubit() : super(SearchNewsInitialState());

}
