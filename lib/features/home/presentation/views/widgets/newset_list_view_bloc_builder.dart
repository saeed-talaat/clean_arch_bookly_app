import 'package:clean_artc_bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:clean_artc_bookly_app/features/home/presentation/manger/newset_books_cubits/newset_books_cubit.dart';
import 'package:clean_artc_bookly_app/features/home/presentation/views/widgets/best_seller_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsetListViewBlocBuilder extends StatefulWidget {
  const NewsetListViewBlocBuilder({super.key});

  @override
  State<NewsetListViewBlocBuilder> createState() =>
      _NewsetListViewBlocBuilderState();
}

class _NewsetListViewBlocBuilderState extends State<NewsetListViewBlocBuilder> {
  List<BookEntity> books = [];
  final Set<String> _bookIds = {};

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsetBooksCubit, NewsetBooksState>(
      listener: (context, state) {
        if (state is NewsetBooksSuccess) {
          for (var book in state.books) {
            if (_bookIds.add(book.bookId)) {
              books.add(book);
            }
          }
        } else if (state is NewsetBooksPaginationFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.errorMessage)),
          );
        }
      },
      builder: (context, state) {
        if (state is NewsetBooksSuccess ||
            state is NewsetBooksPaginationLoading ||
            state is NewsetBooksPaginationFailure) {
          return NewestListView(books: List.of(books));
        } else if (state is NewsetBooksFailure) {
          return SliverToBoxAdapter(
            child: Center(child: Text(state.errorMessage)),
          );
        } else {
          return SliverToBoxAdapter(
            child: Center(child: CircularProgressIndicator()),
          );
        }
      },
    );
  }
}
