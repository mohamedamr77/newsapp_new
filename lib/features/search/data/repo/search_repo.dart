
import 'package:dartz/dartz.dart';
import 'package:newsappcode/features/home_page/data/model/home_model.dart';

import '../../../../core/failure.dart';


abstract class SearchRepo {
  Future<Either<Failure, List<ArticlesModel>>> fetchSearchResult(
      {required String category});
}
