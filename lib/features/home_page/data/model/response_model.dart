import 'package:equatable/equatable.dart';

import 'article_model.dart';

class ResponseModel extends Equatable {
  final String? status;
  final int? totalResults;
  final List<ArticlesModel>? articles;

  const ResponseModel({this.status, this.totalResults, this.articles});

  ResponseModel.fromJson(Map<String, dynamic> json)
      : status = json['status'],
        totalResults = json['totalResults'],
        articles = json['articles'] != null
            ? List<ArticlesModel>.from(
            json['articles'].map((v) => ArticlesModel.fromJson(v)))
            : null;

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'totalResults': totalResults,
      'articles': articles?.map((v) => v.toJson()).toList(),
    };
  }

  @override
  List<Object?> get props => [status, totalResults, articles];
}