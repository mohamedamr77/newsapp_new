import 'package:equatable/equatable.dart';
import 'package:newsappcode/features/home_page/data/model/source_model.dart';

class ArticlesModel extends Equatable {
  final SourceModel? source;
  final String? author;
  final String? title;
  final String? description;
  final String? url;
  final String? urlToImage;
  final String? publishedAt;
  final String? content;
  bool bookMark;

  // Constructor with default value for bookMark
  ArticlesModel({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
    this.bookMark = false, // Default value set to false
  });

  // fromJson constructor that doesn't involve bookMark (since it's not from the API)
  ArticlesModel.fromJson(Map<String, dynamic> json)
      : source = json['source'] != null ? SourceModel.fromJson(json['source']) : null,
        author = json['author'],
        title = json['title'],
        description = json['description'],
        url = json['url'],
        urlToImage = json['urlToImage'],
        publishedAt = json['publishedAt'],
        content = json['content'],
        bookMark = false; // Set the default value for bookMark to false

  // Convert to JSON (bookMark is local and not sent to the API)
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
      // 'bookMark' is intentionally excluded from this JSON as it's local only
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



