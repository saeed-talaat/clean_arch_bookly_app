import 'package:clean_artc_bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:clean_artc_bookly_app/features/search/domain/use_cases/search_books_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit({required this._searchBooksUseCase}) : super(SearchInitial());

  final SearchBooksUseCase _searchBooksUseCase;

  Future<void> searchBooks({required String query}) async {
    emit(SearchLoading());
    final result = await _searchBooksUseCase.call(query);
    result.fold(
      (failure) => emit(SearchFailure(errorMessage: failure.errorMessage)),
      (books) => emit(SearchSuccess(books: books)),
    );
  }
}
