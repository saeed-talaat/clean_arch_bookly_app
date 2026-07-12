import 'package:clean_artc_bookly_app/core/errors/failure.dart';
import 'package:dio/dio.dart';

class ServerFailure extends Failure {
  ServerFailure({required super.errorMessage});

  factory ServerFailure.fromDioError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(
          errorMessage:
              'Connection to the server timed out. Please check your internet connection and try again.',
        );

      case DioExceptionType.sendTimeout:
        return ServerFailure(
          errorMessage: 'Sending data took too long. Please try again.',
        );

      case DioExceptionType.receiveTimeout:
        return ServerFailure(
          errorMessage:
              'The server took too long to respond. Please try again later.',
        );

      case DioExceptionType.badCertificate:
        return ServerFailure(
          errorMessage:
              'Insecure connection. There is an issue with the server\'s security certificate.',
        );

      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
          e.response?.statusCode,
          e.response?.data,
        );

      case DioExceptionType.cancel:
        return ServerFailure(errorMessage: 'The request was canceled.');

      case DioExceptionType.connectionError:
        return ServerFailure(
          errorMessage: 'No internet connection. Please check your network.',
        );

      case DioExceptionType.unknown:
        if (e.message != null && e.message!.contains('SocketException')) {
          return ServerFailure(
            errorMessage:
                'Unable to connect to the internet. Please check your network.',
          );
        }
        return ServerFailure(
          errorMessage: 'An unexpected error occurred. Please try again later.',
        );

      case DioExceptionType.transformTimeout:
        return ServerFailure(
          errorMessage: 'Data processing timed out. Please try again.',
        );
    }
  }

  factory ServerFailure.fromResponse(int? statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(
        errorMessage: response['error']['message'] ?? 'Unauthorized access.',
      );
    } else if (statusCode == 404) {
      return ServerFailure(
        errorMessage: 'The requested data was not found. try again later ',
      );
    } else if (statusCode == 500) {
      return ServerFailure(
        errorMessage: 'Internal server error. Please try again later.',
      );
    } else {
      return ServerFailure(
        errorMessage: 'An unknown error occurred. Please try again later.',
      );
    }
  }
}
