import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsappcode/features/topic_news/data/repo/topic_news_repo.dart';
import 'package:newsappcode/features/topic_news/presentation/view_model/fetch_topic_news/fetch_top_news_state.dart';
import '../../../../home_page/data/model/home_model.dart';

class FetchTopicNewsCubit extends Cubit<FetchTopicNewsState> {
  FetchTopicNewsCubit(this.topicNewsRepo) : super(FetchTopicNewsInitialState());

  final TopicNewsRepo topicNewsRepo;
  List<ArticlesModel>   topicNewsList= [];
  bool loading = false;

  fetchTopicNewsCubit({required String topic}) async {
    loading = true;
    var result = await topicNewsRepo.fetchTopicNews(topic: topic);
    emit(FetchTopicNewsLoadingState());
    result.fold((error) {
      debugPrint(error.errorMessage);
      loading = false;
      emit(FetchTopicNewsFaliureState(errorMessage: error.errorMessage));
      if (kDebugMode) {
        print(error.errorMessage);
      }
    }, (right) {
      loading = false;
      topicNewsList = right;
      if (kDebugMode) {
        print("list $topicNewsList}");
      }
      emit(FetchTopicNewsSuccessState());
    });
  }




}
