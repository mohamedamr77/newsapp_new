import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:newsappcode/features/search/data/repo/search_repo.dart';
import '../../../../core/api_service.dart';
import '../../../../core/failure.dart';
import '../../../../core/utils/const_variable.dart';
import '../../../home_page/data/model/article_model.dart';

class SearchImplement implements SearchRepo {
  final ApiService apiService;
  SearchImplement(this.apiService);

  @override
  Future<Either<Failure, List<ArticlesModel>>> fetchSearchResult(
      {required String category}) async {
    try {
      var response = await apiService.get(
          endPoint:
              "/everything?q=$category&apiKey=${ConstVariable.apiKey}");
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
