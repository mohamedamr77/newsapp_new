import 'package:equatable/equatable.dart';

class NewsModel extends Equatable {
  final String? status;
  final int? totalResults;
  final List<ArticlesModel>? articles;

  NewsModel({this.status, this.totalResults, this.articles});

  NewsModel.fromJson(Map<String, dynamic> json)
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

class ArticlesModel extends Equatable {
  final Source? source;
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
      : source = json['source'] != null ? Source.fromJson(json['source']) : null,
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
    bookMark,
  ];
}


class Source extends Equatable {
  final String? id;
  final String? name;

  Source({this.id, this.name});

  Source.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'];

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }

  @override
  List<Object?> get props => [id, name];
}
