import 'package:clean_artc_bookly_app/core/errors/failure.dart';
import 'package:clean_artc_bookly_app/core/use_cases.dart/use_case.dart';
import 'package:clean_artc_bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:clean_artc_bookly_app/features/search/domain/repos/search_repo.dart';
import 'package:dartz/dartz.dart';

class SearchBooksUseCase extends UseCase<List<BookEntity>, String> {
  final SearchRepo searchRepo;

  SearchBooksUseCase({required this.searchRepo});

  @override
  Future<Either<Failure, List<BookEntity>>> call([String param = '']) async {
    return await searchRepo.searchBooks(query: param);
  }
}
