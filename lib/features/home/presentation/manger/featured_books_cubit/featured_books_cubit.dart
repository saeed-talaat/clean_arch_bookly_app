import 'package:clean_artc_bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:clean_artc_bookly_app/features/home/domain/use_cases/fetch_featured_books_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit({required this._featuredBooksUseCase})
    : super(FeaturedBooksInitial());

  final FetchFeaturedBooksUseCase _featuredBooksUseCase;

  Future<void> fetchFeaturedBooks({int pageNumber = 0}) async {
    if (pageNumber == 0) {
      emit(FeaturedBooksLoading());
    } else {
      emit(FeaturedBooksPaginationLoading());
    }
    final result = await _featuredBooksUseCase.call(pageNumber);
    result.fold((failure) {
      if (pageNumber == 0) {
        emit(FeaturedBooksFailure(errorMessage: failure.errorMessage));
      } else {
        emit(
          FeaturedBooksPaginationFailure(errorMessage: failure.errorMessage),
        );
      }
    }, (books) => emit(FeaturedBooksSuccess(books: books)));
  }
}
