import 'package:hive/hive.dart';

part 'search_query_model.g.dart'; // This file will be generated

@HiveType(typeId: 0)
class SearchQueryModel extends HiveObject {
  @HiveField(0)
  final String query;

  SearchQueryModel(this.query);
}
