import 'package:clean_artc_bookly_app/core/errors/failure.dart';
import 'package:clean_artc_bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:dartz/dartz.dart';

abstract class SearchRepo {
  Future<Either<Failure, List<BookEntity>>> searchBooks({
    required String query,
    int pageNumber = 0,
  });
}
