import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:newsappcode/core/api_service.dart';
import 'package:newsappcode/core/failure.dart';
import 'package:newsappcode/features/home_page/data/model/home_model.dart';
import 'package:newsappcode/features/home_page/data/repo/home_repo.dart';

class HomeImplement implements HomeRepo{
  final ApiService apiService;
  
  HomeImplement(this.apiService);
  @override
  Future<Either<Failure, List<ArticlesModel>>> getGeneralNews() async{
    try {
      var response = await apiService.get(endPoint: "/everything?q=gaza&apiKey=08433c8dda43458fa30826408cb8219e");
      List<dynamic> articlesFromApi = response["articles"];
      List<ArticlesModel> articlesList = [];
      for (int i = 0; i < articlesFromApi.length; i++) {
        articlesList.add(ArticlesModel.fromJson(articlesFromApi[i]));
      }
      debugPrint(articlesList.toString());
      return right(articlesList);
    }catch (e){
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        return left(ServerFailure(errorMessage: e.toString()));
      }

    }
  }


}
/*
  try {
      var response = await apiService.get(
          endpoint:
              "volumes?Filtering=free-ebooks&q=subject:art&Sorting=newest");
      List<dynamic> booksFromApi = response["items"];
      List<BookModel> booksList = [];
      for (int i = 0; i < booksFromApi.length; i++) {
        booksList.add(BookModel.fromJson(booksFromApi[i]));
      }
      debugPrint(booksList.toString());
      return right(booksList);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        return left(ServerFailure(errorMessage: e.toString()));
      }
    }
 */