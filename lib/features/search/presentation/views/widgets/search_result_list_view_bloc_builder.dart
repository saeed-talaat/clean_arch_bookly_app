import 'package:clean_artc_bookly_app/features/home/presentation/manger/newset_books_cubits/newset_books_cubit.dart';
import 'package:clean_artc_bookly_app/features/search/presentation/views/widgets/search_result_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchResultListViewBlocBuilder extends StatelessWidget {
  const SearchResultListViewBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsetBooksCubit, NewsetBooksState>(
      builder: (context, state) {
        if (state is NewsetBooksSuccess) {
          return SearchResultListView(books: state.books,) ;
        } else if (state is NewsetBooksFailure) {
          return Center(child: Text(state.errorMessage));
        } else {
           return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
