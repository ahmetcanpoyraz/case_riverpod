import 'package:dartz/dartz.dart';
import '../../core/network/network_data_manager.dart';
import '../../core/utils/error_handler.dart';
import '../models/news_model.dart';

class NewsRepository {
  final NetworkDataManager networkDataManager;

  NewsRepository(this.networkDataManager);

  Future<Either<String, NewsModel>> fetchNews(
      String searchWord, int page, int pageSize) async {
    try {
      final response =
          await networkDataManager.get(searchWord, page: page, pageSize: pageSize);
      final newsModel = NewsModel.fromJson(response.data);
      return Right(newsModel);
    } on NetworkException catch (e) {
      return Left(e.message);
    } catch (e) {
      return const Left("An unknown error occurred.");
    }
  }
}
