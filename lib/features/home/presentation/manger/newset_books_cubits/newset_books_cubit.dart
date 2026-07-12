import 'package:clean_artc_bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:clean_artc_bookly_app/features/home/domain/use_cases/fetch_newset_books_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'newset_books_state.dart';

class NewsetBooksCubit extends Cubit<NewsetBooksState> {
  NewsetBooksCubit({required this.fetchNewsetBooksUseCase})
    : super(NewsetBooksInitial());

  final FetchNewsetBooksUseCase fetchNewsetBooksUseCase;

  Future<void> fetchNewsetBooks() async {
    emit(NewsetBooksLoading());
    final result = await fetchNewsetBooksUseCase.call();
    result.fold(
      (failure) => emit(NewsetBooksFailure(errorMessage: failure.errorMessage)),
      (books) => emit(NewsetBooksSuccess(books: books)),
    );
  }
}
