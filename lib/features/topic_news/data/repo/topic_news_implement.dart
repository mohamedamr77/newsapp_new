import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:newsappcode/core/failure.dart';
import 'package:newsappcode/features/home_page/data/model/article_model.dart';
import 'package:newsappcode/features/topic_news/data/repo/topic_news_repo.dart';

import '../../../../core/api_service.dart';
import '../../../../core/utils/const_variable.dart';

class TopicNewsImplement implements TopicNewsRepo {
  final ApiService apiService;

  TopicNewsImplement(this.apiService);
  @override
  Future<Either<Failure, List<ArticlesModel>>> fetchTopicNews(
      {required String topic, required int pageNumber}) async {
    try {
      var response = await apiService.get(
          endPoint:
              "/everything?q=$topic&apiKey=${ConstVariable.apiKey}&page=$pageNumber&pageSize=20");
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
