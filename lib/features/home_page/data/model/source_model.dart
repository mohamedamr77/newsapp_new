import 'package:equatable/equatable.dart';

class SourceModel extends Equatable {
  final String? id;
  final String? name;

  const SourceModel({this.id, this.name});

  SourceModel.fromJson(Map<String, dynamic> json)
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