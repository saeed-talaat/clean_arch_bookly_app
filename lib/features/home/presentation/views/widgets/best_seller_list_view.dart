import 'package:clean_artc_bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:clean_artc_bookly_app/features/home/presentation/manger/newset_books_cubits/newset_books_cubit.dart';
import 'package:clean_artc_bookly_app/features/home/presentation/views/widgets/best_seller_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewestListView extends StatefulWidget {
  const NewestListView({super.key, required this.books});

  final List<BookEntity> books;

  @override
  State<NewestListView> createState() => _NewestListViewState();
}

class _NewestListViewState extends State<NewestListView> {
  ScrollController? _scrollController;
  bool _isLoadingMore = false;
  int nextPage = 1;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _scrollController?.removeListener(_onScroll);
    _scrollController = PrimaryScrollController.maybeOf(context);
    _scrollController?.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController == null || !_scrollController!.hasClients) return;

    final maxScroll = _scrollController!.position.maxScrollExtent;
    final currentScroll = _scrollController!.position.pixels;

    if (currentScroll >= (maxScroll * 0.7) && !_isLoadingMore) {
      _isLoadingMore = true;
      context.read<NewsetBooksCubit>().fetchNewsetBooks(
        pageNumber: nextPage,
      );
    }
  }

  @override
  void dispose() {
    _scrollController?.removeListener(_onScroll);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<NewsetBooksCubit, NewsetBooksState>(
      listener: (context, state) {
        if (state is NewsetBooksSuccess) {
          nextPage++;
          _isLoadingMore = false;
        } else if (state is NewsetBooksPaginationFailure) {
          _isLoadingMore = false;
        }
      },
      child: SliverList.builder(
        itemCount: widget.books.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.only(top: 16),
            child: NewestItem(bookEntity: widget.books[index]),
          );
        },
      ),
    );
  }
}
