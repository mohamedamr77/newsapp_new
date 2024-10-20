import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsappcode/features/home_page/data/model/article_model.dart';

import '../../../data/repo/home_repo.dart';
import 'get_general_news_state.dart';

class GetGeneralNewsCubit extends Cubit<GetGeneralNewsState> {
  GetGeneralNewsCubit(this.homeRepo) : super(GetGeneralNewsInitialState());
  final HomeRepo homeRepo;
  List<ArticlesModel> generalNewsList = [];

  Map<String, List<ArticlesModel>> generalNewsMap = {};

  fetchGeneralNews({required List<ArticlesModel> newsMarkList}) async {
    emit(GetGeneralNewsLoadingState());
    var result = await homeRepo.getGeneralNews();
    result.fold((error) {
      emit(GetGeneralNewsFaliureState(errorMessage: error.errorMessage));
    }, (right) {
      generalNewsList = right;

      generalNewsList = generalNewsList.map((newsItem) {
        // first new   --> newsItem
        if (newsMarkList.any((newsMark) => newsMark == newsItem)) {
          newsItem.newsMark = true; // Assuming you have a `isNewsMarked` field
        }
        return newsItem;
      }).toList();

      generalNewsMap.addAll({
        "generalNews": generalNewsList,
      });
      emit(GetGeneralNewsSuccessState());
    });
  }
}
