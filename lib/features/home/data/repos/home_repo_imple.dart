import 'dart:developer';

import 'package:clean_artc_bookly_app/core/errors/failure.dart';
import 'package:clean_artc_bookly_app/core/errors/server_failure.dart';
import 'package:clean_artc_bookly_app/features/home/data/data_sources/home_local_data_sources.dart';
import 'package:clean_artc_bookly_app/features/home/data/data_sources/home_remote_data_sources.dart';
import 'package:clean_artc_bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:clean_artc_bookly_app/features/home/domain/repos/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImple implements HomeRepo {
  final HomeRemoteDataSources homeRemoteDataSources;
  final HomeLocalDataSources homeLocalDataSources;

  HomeRepoImple({
    required this.homeRemoteDataSources,
    required this.homeLocalDataSources,
  });

  @override
  Future<Either<Failure, List<BookEntity>>> fetchFeaturedBooks({
    int pageNumber = 0,
  }) async {
    try {
      List<BookEntity> books = homeLocalDataSources.fetchFeaturedBooks(
        pageNumber: pageNumber,
      );

      if (books.isNotEmpty) {
        return right(books);
      }

      int maxRetries = 3;
      for (int attempt = 0; attempt < maxRetries; attempt++) {
        try {
          books = await homeRemoteDataSources.fetchFeaturedBooks(
            pageNumber: pageNumber,
          );
          return right(books);
        } catch (remoteError) {
          if (attempt == maxRetries - 1) {
            rethrow;
          }
          await Future.delayed(Duration(seconds: 15));
        }
      }
      return left(ServerFailure(errorMessage: 'Unexpected error occurred'));
    } catch (e) {
      if (e is DioException) {
        log('Exception in HomeRepoImple.fetchFeaturedBooks : ${e.toString()}');
        return left(ServerFailure.fromDioError(e));
      } else {
        log('Exception in HomeRepoImple.fetchFeaturedBooks : ${e.toString()}');
        return left(
          ServerFailure(errorMessage: 'Failed to fetch books try again later!'),
        );
      }
    }
  }

  @override
  Future<Either<Failure, List<BookEntity>>> fetchNewsetBooks({
    int pageNumber = 0,
  }) async {
    try {
      List<BookEntity> books = homeLocalDataSources.fetchNewsetBooks(
        pageNumber: pageNumber,
      );

      if (books.isNotEmpty) {
        return right(books);
      }

      int maxRetries = 3;
      for (int attempt = 0; attempt < maxRetries; attempt++) {
        try {
          books = await homeRemoteDataSources.fetchNewsetBooks(
            pageNumber: pageNumber,
          );
          return right(books);
        } catch (remoteError) {
          if (attempt == maxRetries - 1) {
            rethrow;
          }
          await Future.delayed(Duration(seconds: 15));
        }
      }
      return left(ServerFailure(errorMessage: 'Unexpected error occurred'));
    } catch (e) {
      if (e is DioException) {
        log('Exception in  HomeRepoImple.fetchNewsetBooks : ${e.toString()}');
        return left(ServerFailure.fromDioError(e));
      } else {
        log('Exception in  HomeRepoImple.fetchNewsetBooks : ${e.toString()}');
        return left(
          ServerFailure(errorMessage: 'Failed to fetch books try again later!'),
        );
      }
    }
  }
}
