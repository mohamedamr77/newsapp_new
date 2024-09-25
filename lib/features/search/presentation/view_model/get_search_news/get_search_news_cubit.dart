import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsappcode/features/home_page/data/model/home_model.dart';
import '../../../data/repo/search_repo.dart';
import 'get_search_news_state.dart';

class GetSearchNewsCubit extends Cubit<SearchNewsState> {
  GetSearchNewsCubit(this.searchRepo) : super(SearchNewsInitialState());
  final SearchRepo searchRepo;
  List<ArticlesModel> resultSearchList = [];

  bool loading = false;

  fetchSearchResult({required String category}) async {
    loading = true;
    var result = await searchRepo.fetchSearchResult(category: category);
    emit(SearchNewsLoadingState());
    result.fold((error) {
      debugPrint(error.errorMessage);
      loading = false;
      emit(SearchNewsFaliureState(errorMessage: error.errorMessage));
      if (kDebugMode) {
        print(error.errorMessage);
      }
    }, (right) {
      loading = false;
      resultSearchList = right;
      if (kDebugMode) {
        print("list $resultSearchList}");
      }
      emit(SearchNewsSuccessState());
    });
  }

}
