import 'package:clean_artc_bookly_app/core/utils/functions/get_dummy_books.dart';
import 'package:clean_artc_bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:clean_artc_bookly_app/features/home/presentation/manger/featured_books_cubit/featured_books_cubit.dart';
import 'package:clean_artc_bookly_app/features/home/presentation/views/widgets/featured_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class FeaturedListViewBlocBuilder extends StatefulWidget {
  const FeaturedListViewBlocBuilder({super.key});

  @override
  State<FeaturedListViewBlocBuilder> createState() =>
      _FeaturedListViewBlocBuilderState();
}

class _FeaturedListViewBlocBuilderState
    extends State<FeaturedListViewBlocBuilder> {
  List<BookEntity> books = [];
  final Set<String> _bookIds = {};

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FeaturedBooksCubit, FeaturedBooksState>(
      listener: (context, state) {
        if (state is FeaturedBooksSuccess) {
          for (var book in state.books) {
            if (_bookIds.add(book.bookId)) {
              books.add(book);
            }
          }
        } else if (state is FeaturedBooksPaginationFailure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
        }
      },
      builder: (context, state) {
        if (state is FeaturedBooksSuccess ||
            state is FeaturedBooksPaginationLoading ||
            state is FeaturedBooksPaginationFailure) {
          return FeaturedListView(books: List.of(books));
        } else if (state is FeaturedBooksFailure) {
          return Center(child: Text(state.errorMessage));
        } else {
          return Skeletonizer(
            enabled: state is FeaturedBooksLoading ? true : false,
            child: FeaturedListView(books: getDummyBooksList()),
          );
        }
      },
    );
  }
}
