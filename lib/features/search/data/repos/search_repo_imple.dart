import 'dart:developer';

import 'package:clean_artc_bookly_app/core/errors/failure.dart';
import 'package:clean_artc_bookly_app/core/errors/server_failure.dart';
import 'package:clean_artc_bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:clean_artc_bookly_app/features/search/data/data_sources/search_local_data_sources.dart';
import 'package:clean_artc_bookly_app/features/search/data/data_sources/search_remote_data_sources.dart';
import 'package:clean_artc_bookly_app/features/search/domain/repos/search_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SearchRepoImple implements SearchRepo {
  final SearchRemoteDataSources searchRemoteDataSources;
  final SearchLocalDataSources searchLocalDataSources;

  SearchRepoImple({
    required this.searchRemoteDataSources,
    required this.searchLocalDataSources,
  });

  @override
  Future<Either<Failure, List<BookEntity>>> searchBooks({
    required String query,
    int pageNumber = 0,
  }) async {
    try {
      List<BookEntity> books = searchLocalDataSources.searchBooks(
        query: query,
      );

      if (books.isNotEmpty) {
        return right(books);
      }

      int maxRetries = 3;
      for (int attempt = 0; attempt < maxRetries; attempt++) {
        try {
          books = await searchRemoteDataSources.searchBooks(
            query: query,
            pageNumber: pageNumber,
          );
          return right(books);
        } catch (remoteError) {
          if (attempt == maxRetries - 1) {
            rethrow;
          }
          await Future.delayed(Duration(seconds: 8));
        }
      }
      return left(ServerFailure(errorMessage: 'Unexpected error occurred'));
    } catch (e) {
      if (e is DioException) {
        log('Exception in SearchRepoImple.searchBooks : ${e.toString()}');
        return left(ServerFailure.fromDioError(e));
      } else {
        log('Exception in SearchRepoImple.searchBooks : ${e.toString()}');
        return left(
          ServerFailure(errorMessage: 'Failed to search books try again later!'),
        );
      }
    }
  }
}
