import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import '../../config/config.dart';
import '../constants/endpoints.dart';
import '../utils/error_handler.dart';

class NetworkDataManager {
  final Dio dio;

  NetworkDataManager(this.dio) {
    dio.options.baseUrl = Endpoints.baseUrl;
    dio.interceptors.add(CustomInterceptors());
  }

  Future<Response> get(String searchWord,
      {required int page, required int pageSize}) async {
    try {
      final response = await dio.get(
        "$searchWord&apiKey=${Config.apiKey}",
        queryParameters: {
          'page': page,
          'pageSize': pageSize,
        },
      );
      return response;
    } on DioException catch (err) {
      final errorMessage = ErrorHandler.handleException(err);
      throw NetworkException(errorMessage);
    }
  }
}

class CustomInterceptors extends Interceptor {
  @override
  Future<void> onError(DioException err, ErrorInterceptorHandler handler) async {
    final errorMessage = ErrorHandler.handleException(err);
    if (kDebugMode) {
      print("Error: $errorMessage");
    }
    return super.onError(err, handler);
  }
}
