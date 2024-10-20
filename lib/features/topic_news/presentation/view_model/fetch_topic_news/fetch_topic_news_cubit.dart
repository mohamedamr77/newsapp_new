import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsappcode/features/topic_news/data/repo/topic_news_repo.dart';
import 'package:newsappcode/features/topic_news/presentation/view_model/fetch_topic_news/fetch_top_news_state.dart';
import '../../../../home_page/data/model/article_model.dart';

class FetchTopicNewsCubit extends Cubit<FetchTopicNewsState> {
  FetchTopicNewsCubit(this.topicNewsRepo) : super(FetchTopicNewsInitialState());

  final TopicNewsRepo topicNewsRepo;
  List<ArticlesModel> topicNewsList = [];
  Map<int, List<ArticlesModel>> topicNewsMap = {};
  bool loading = false;
  Map<int, int> pageNumbers = {};  // Store page numbers for each topic

  fetchTopicNewsCubit(
      {required String topic,
      required int index,
      required List<ArticlesModel> newsMarksList,
       bool isLoadingMore =false,
      }) async {
    loading = true;
    int pageNumber = pageNumbers[index] ?? 1;
    var result = await topicNewsRepo.fetchTopicNews(topic: topic, pageNumber: pageNumber);

     if(isLoadingMore){
           emit(FetchTopicNewsPaginationLoadingState());
     }else{
       emit(FetchTopicNewsLoadingState());
     }

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

      topicNewsList = topicNewsList.map((newsItem) {
        // first new   --> newsItem
        if (newsMarksList.any((newsMark) => newsMark == newsItem)) {
          newsItem.newsMark = true; // Assuming you have a `isNewsMarked` field
        }
        return newsItem;
      }).toList();

      topicNewsMap.addAll({
        index: topicNewsList,
      });

      if (isLoadingMore ){
        pageNumbers[index] = pageNumber + 1;
      }

      if (kDebugMode) {
        print("list $topicNewsList}");
      }
      emit(FetchTopicNewsSuccessState());
    });
  }
}
