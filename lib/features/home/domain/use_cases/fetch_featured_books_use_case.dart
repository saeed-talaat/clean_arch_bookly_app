import 'package:clean_artc_bookly_app/core/errors/failure.dart';
import 'package:clean_artc_bookly_app/core/use_cases.dart/use_case.dart';
import 'package:clean_artc_bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:clean_artc_bookly_app/features/home/domain/repos/home_repo.dart';
import 'package:dartz/dartz.dart';

class FetchFeaturedBooksUseCase extends UseCase<List<BookEntity>, NoParm> {
  final HomeRepo homeRepo;

  FetchFeaturedBooksUseCase({required this.homeRepo});

  @override
  Future<Either<Failure, List<BookEntity>>> call([NoParm? parm]) async {
    return await homeRepo.fetchFeaturedBooks();
  }
}
