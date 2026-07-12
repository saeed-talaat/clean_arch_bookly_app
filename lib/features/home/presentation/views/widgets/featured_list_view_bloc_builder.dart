import 'package:clean_artc_bookly_app/features/home/presentation/manger/featured_books_cubit/featured_books_cubit.dart';
import 'package:clean_artc_bookly_app/features/home/presentation/views/widgets/featured_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeaturedListViewBlocBuilder extends StatelessWidget {
  const FeaturedListViewBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, state) {
        if (state is FeaturedBooksSuccess) {
          return FeaturedListView(books: state.books,) ;
        } else if (state is FeaturedBooksFailure) {
          return Center(child: Text(state.errorMessage));
        } else {
           return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
