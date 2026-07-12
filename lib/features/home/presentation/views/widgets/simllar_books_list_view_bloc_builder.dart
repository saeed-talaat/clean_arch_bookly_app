import 'package:clean_artc_bookly_app/features/home/presentation/manger/newset_books_cubits/newset_books_cubit.dart';
import 'package:clean_artc_bookly_app/features/home/presentation/views/widgets/simllar_books_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimllarBooksListViewBlocBuilder extends StatelessWidget {
  const SimllarBooksListViewBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsetBooksCubit, NewsetBooksState>(
      builder: (context, state) {
        if (state is NewsetBooksSuccess) {
          return SimllarBooksListView(books: state.books,) ;
        } else if (state is NewsetBooksFailure) {
          return SliverToBoxAdapter(child: Center(child: Text(state.errorMessage)));
        } else {
           return SliverToBoxAdapter(child: Center(child: CircularProgressIndicator()));
        }
      },
    );
  }
}
