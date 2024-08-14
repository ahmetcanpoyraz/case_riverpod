import 'dart:io';
import 'package:dio/dio.dart';

class NetworkException implements Exception {
  final String message;
  NetworkException(this.message);

  @override
  String toString() => message;
}

class ErrorHandler {
  static String handleException(DioException error) {
    if (error.response != null) {
      switch (error.response!.statusCode) {
        case 400:
          return 'Bad Request: ${error.response!.data}';
        case 401:
          return 'Unauthorized: ${error.response!.data}';
        case 403:
          return 'Forbidden: ${error.response!.data}';
        case 404:
          return 'Not Found: ${error.response!.data}';
        case 500:
          return 'Internal Server Error: ${error.response!.data}';
        default:
          return 'Something went wrong: ${error.response!.data}';
      }
    } else if (error.error is SocketException) {
      return 'No Internet Connection';
    } else {
      return 'Unexpected error occurred';
    }
  }
}
