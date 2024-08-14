// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_query_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SearchQueryModelAdapter extends TypeAdapter<SearchQueryModel> {
  @override
  final int typeId = 0;

  @override
  SearchQueryModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SearchQueryModel(
      fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, SearchQueryModel obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.query);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SearchQueryModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
