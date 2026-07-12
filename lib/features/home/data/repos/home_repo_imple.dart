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
  Future<Either<Failure, List<BookEntity>>> fetchFeaturedBooks() async {
    try {
      List<BookEntity> books = homeLocalDataSources.fetchFeaturedBooks();
      if (books.isEmpty) {
        books = await homeRemoteDataSources.fetchFeaturedBooks();
      }
      return right(books);
    } catch (e) {
      if (e is DioException) {
        log('Exception in  HomeRepoImple.fetchFeaturedBooks : ${e.toString()}');
        return left(ServerFailure.fromDioError(e));
      } else {
        log('Exception in  HomeRepoImple.fetchFeaturedBooks : ${e.toString()}');
        return left(
          ServerFailure(errorMessage: 'Failed to fetch books try again later!'),
        );
      }
    }
  }

  @override
  Future<Either<Failure, List<BookEntity>>> fetchNewsetBooks() async {
    try {
      List<BookEntity> books = homeLocalDataSources.fetchNewsetBooks();
      if (books.isEmpty) {
        books = await homeRemoteDataSources.fetchNewsetBooks();
      }
      return right(books);
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
