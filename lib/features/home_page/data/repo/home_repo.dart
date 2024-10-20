import 'package:dartz/dartz.dart';
import 'package:newsappcode/core/failure.dart';
import 'package:newsappcode/features/home_page/data/model/article_model.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<ArticlesModel>>> getGeneralNews();
}
