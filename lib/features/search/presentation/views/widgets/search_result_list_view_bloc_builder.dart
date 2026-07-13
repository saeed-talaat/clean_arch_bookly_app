import 'package:clean_artc_bookly_app/features/search/presentation/manger/search_cubit/search_cubit.dart';
import 'package:clean_artc_bookly_app/features/search/presentation/views/widgets/search_result_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchResultListViewBlocBuilder extends StatelessWidget {
  const SearchResultListViewBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is SearchSuccess) {
          return SearchResultListView(books: state.books);
        } else if (state is SearchFailure) {
          return Center(child: Text(state.errorMessage));
        } else if (state is SearchLoading) {
          return Center(child: CircularProgressIndicator());
        } else {
          return Center(
            child: Text(
              'Search by title or author name',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          );
        }
      },
    );
  }
}
