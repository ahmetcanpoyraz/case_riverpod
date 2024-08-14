import 'package:hive/hive.dart';
import '../../data/models/news_model.dart';
import '../../data/models/search_query_model.dart';

class HiveBoxHelper {
  static const _searchBoxName = 'searchQueries';

  static Future<Box<SearchQueryModel>> openSearchBox() async {
    return Hive.openBox<SearchQueryModel>(_searchBoxName);
  }

  static Future<void> addSearchQuery(SearchQueryModel queryModel) async {
    final box = await openSearchBox();

    // Check if the query already exists
    final queryExists =
        box.values.any((existingQuery) => existingQuery.query == queryModel.query);

    if (!queryExists) {
      if (box.length >= 5) {
        // Remove the oldest entry if the limit is reached
        await box.deleteAt(0);
      }
      await box.add(queryModel);
    }
  }

  // Get all search queries
  static Future<List<SearchQueryModel>> getSearchQueries() async {
    final box = await openSearchBox();
    return box.values.toList();
  }
}
