import 'package:clean_artc_bookly_app/core/errors/custom_exception.dart';
import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio;
  final _baseUrl = 'https://www.googleapis.com/books/v1/';
  final _apiKey = 'AIzaSyDMfQ9kYrvYk9QXMNkBRkexFDaPadLWZdE';


  ApiService({required this._dio});

   Future<Map<String , dynamic>> get({required String endpoint, String? token}) async {
    Map<String, String> headers = {};
    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }

    try {
      Response response = await _dio.get(
       '$_baseUrl$endpoint&key=$_apiKey',
        options: Options(headers: headers),
      );
      return response.data;
    } on DioException catch (e) {
      final errorData = e.response?.data;
      final message = errorData is Map<String, dynamic>
          ? errorData['message']?.toString()
          : null;
      throw CustomException(
        errorMessage:
            message ??
            e.message ??
            'Connection error with status ${e.response?.statusCode}',
      );
    }
  }

  Future<dynamic> post({
    dynamic body,
    String? token,
    required String url,
  }) async {
    Map<String, String> headers = {};
    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }

    try {
      Response response = await _dio.post(
        '$_baseUrl$url&key=$_apiKey',
        data: body,
        options: Options(headers: headers),
      );
      return response.data;
    } on DioException catch (e) {
      final errorData = e.response?.data;
      final message = errorData is Map<String, dynamic>
          ? errorData['message']?.toString()
          : null;
      throw CustomException(
        errorMessage: message ?? e.message ?? 'Connection error',
      );
    }
  }

  Future<dynamic> put({
    dynamic body,
    String? token,
    required String url,
  }) async {
    Map<String, String> headers = {};
    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }

    try {
      Response response = await _dio.put(
        url,
        data: body,
        options: Options(headers: headers),
      );
      return response.data;
    } on DioException catch (e) {
      final errorData = e.response?.data;
      final message = errorData is Map<String, dynamic>
          ? errorData['message']?.toString()
          : null;
      throw CustomException(
        errorMessage:
            message ??
            e.message ??
            'Connection error with status ${e.response?.statusCode}',
      );
    }
  }

  Future<dynamic> delete({
    String? token,
    required String url,
  }) async {
    Map<String, String> headers = {};
    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }

    try {
      Response response = await _dio.delete(
        '$_baseUrl$url&key=$_apiKey',
        options: Options(headers: headers),
      );
      return response.data;
    } on DioException catch (e) {
      final errorData = e.response?.data;
      final message = errorData is Map<String, dynamic>
          ? errorData['message']?.toString()
          : null;
      throw CustomException(
        errorMessage:
            message ??
            e.message ??
            'Connection error with status ${e.response?.statusCode}',
      );
    }
  }


}