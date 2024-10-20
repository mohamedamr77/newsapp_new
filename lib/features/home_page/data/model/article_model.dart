import 'package:equatable/equatable.dart';
import 'package:newsappcode/features/home_page/data/model/source_model.dart';
import 'package:hive/hive.dart';
part 'article_model.g.dart';

@HiveType(typeId: 0)
// ignore: must_be_immutable
class ArticlesModel extends Equatable {
  @HiveField(1)
  final SourceModel? source;
  @HiveField(2)
  final String? author;
  @HiveField(3)
  final String? title;
  @HiveField(4)
  final String? description;
  @HiveField(5)
  final String? url;
  @HiveField(6)
  final String? urlToImage;
  @HiveField(7)
  final String? publishedAt;
  @HiveField(8)
  final String? content;
  @HiveField(9)
  bool newsMark;

  // Constructor with default value for NewsMark
  ArticlesModel({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
    this.newsMark = false, // Default value set to false
  });

  // fromJson constructor that doesn't involve NewsMark (since it's not from the API)
  ArticlesModel.fromJson(Map<String, dynamic> json)
      : source = json['source'] != null
            ? SourceModel.fromJson(json['source'])
            : null,
        author = json['author'],
        title = json['title'],
        description = json['description'],
        url = json['url'],
        urlToImage = json['urlToImage'],
        publishedAt = json['publishedAt'],
        content = json['content'],
        newsMark = false; // Set the default value for NewsMark to false

  // Convert to JSON (NewsMark is local and not sent to the API)
  Map<String, dynamic> toJson() {
    return {
      'source': source?.toJson(),
      'author': author,
      'title': title,
      'description': description,
      'url': url,
      'urlToImage': urlToImage,
      'publishedAt': publishedAt,
      'content': content,
      // 'NewsMark' is intentionally excluded from this JSON as it's local only
    };
  }

  // Equatable props for comparison
  @override
  List<Object?> get props => [
        source,
        author,
        title,
        description,
        url,
        urlToImage,
        publishedAt,
        content,
      ];
}
