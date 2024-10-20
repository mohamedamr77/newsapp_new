import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:newsappcode/core/failure.dart';
import 'package:newsappcode/features/home_page/data/model/article_model.dart';
import 'package:newsappcode/features/topic_news/data/repo/topic_news_repo.dart';

import '../../../../core/api_service.dart';

class TopicNewsImplement implements TopicNewsRepo {
  final ApiService apiService;

  TopicNewsImplement(this.apiService);
  @override
  Future<Either<Failure, List<ArticlesModel>>> fetchTopicNews(
      {required String topic}) async {
    try {
      var response = await apiService.get(
          endPoint:
              "/everything?q=$topic&apiKey=08433c8dda43458fa30826408cb8219e");
      List<dynamic> articlesFromApi = response["articles"];
      List<ArticlesModel> articlesList = [];
      for (int i = 0; i < articlesFromApi.length; i++) {
        articlesList.add(ArticlesModel.fromJson(articlesFromApi[i]));
      }
      debugPrint(articlesList.toString());
      return right(articlesList);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        debugPrint(e.toString());
        return left(ServerFailure(errorMessage: e.toString()));
      }
    }
  }
}
