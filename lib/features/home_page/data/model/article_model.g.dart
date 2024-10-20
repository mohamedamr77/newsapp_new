// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ArticlesModelAdapter extends TypeAdapter<ArticlesModel> {
  @override
  final int typeId = 0;

  @override
  ArticlesModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ArticlesModel(
      source: fields[1] as SourceModel?,
      author: fields[2] as String?,
      title: fields[3] as String?,
      description: fields[4] as String?,
      url: fields[5] as String?,
      urlToImage: fields[6] as String?,
      publishedAt: fields[7] as String?,
      content: fields[8] as String?,
      bookMark: fields[9] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, ArticlesModel obj) {
    writer
      ..writeByte(9)
      ..writeByte(1)
      ..write(obj.source)
      ..writeByte(2)
      ..write(obj.author)
      ..writeByte(3)
      ..write(obj.title)
      ..writeByte(4)
      ..write(obj.description)
      ..writeByte(5)
      ..write(obj.url)
      ..writeByte(6)
      ..write(obj.urlToImage)
      ..writeByte(7)
      ..write(obj.publishedAt)
      ..writeByte(8)
      ..write(obj.content)
      ..writeByte(9)
      ..write(obj.bookMark);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ArticlesModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
