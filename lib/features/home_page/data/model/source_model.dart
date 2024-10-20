import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
part 'source_model.g.dart';

@HiveType(typeId: 1)
class SourceModel extends Equatable {
  @HiveField(1)
  final String? id;
  @HiveField(2)
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
