import 'package:dartz/dartz.dart';

import '../../../../core/failure.dart';
import '../../../home_page/data/model/article_model.dart';

abstract class TopicNewsRepo {
  Future<Either<Failure, List<ArticlesModel>>> fetchTopicNews(
      {required String topic});
}
