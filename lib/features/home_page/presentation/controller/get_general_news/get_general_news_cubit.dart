import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsappcode/features/home_page/data/model/home_model.dart';

import '../../../data/repo/home_repo.dart';
import 'get_general_news_state.dart';

class GetGeneralNewsCubit extends Cubit<GetGeneralNewsState> {
  GetGeneralNewsCubit(this.homeRepo) : super(GetGeneralNewsInitialState());
  final HomeRepo homeRepo;
  List<ArticlesModel> generalNews = [];

  fetchGeneralNews() async {
    emit(GetGeneralNewsLoadingState());
    var result = await homeRepo.getGeneralNews();
    result.fold((error) {
      emit(GetGeneralNewsFaliureState(errorMessage: error.errorMessage));
    }, (right) {
      generalNews = right;
      emit(GetGeneralNewsSuccessState());
    });
  }
}
