import 'package:clean_artc_bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:clean_artc_bookly_app/features/home/presentation/manger/featured_books_cubit/featured_books_cubit.dart';
import 'package:clean_artc_bookly_app/features/home/presentation/views/widgets/featured_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeaturedListView extends StatefulWidget {
  const FeaturedListView({super.key, required this.books});

  final List<BookEntity> books;

  @override
  State<FeaturedListView> createState() => _FeaturedListViewState();
}

class _FeaturedListViewState extends State<FeaturedListView> {
  late final ScrollController _scrollController;

  bool _isLoadingMore = false;
  int nextPage = 1;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (!_scrollController.hasClients) return;

    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;

    if (currentScroll >= (maxScroll * 0.7) && !_isLoadingMore) {
      _isLoadingMore = true;
      context.read<FeaturedBooksCubit>().fetchFeaturedBooks(
        pageNumber: nextPage,
      );
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<FeaturedBooksCubit, FeaturedBooksState>(
      listener: (context, state) {
        if (state is FeaturedBooksSuccess) {
          nextPage++;
          _isLoadingMore = false;
        } else if (state is FeaturedBooksPaginationFailure) {
          _isLoadingMore = false;
        }
      },
      child: SizedBox(
        height: MediaQuery.sizeOf(context).height * 0.3,
        child: ListView.builder(
          controller: _scrollController,
          scrollDirection: Axis.horizontal,
          itemCount: widget.books.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(right: 8),
              child: FeaturedListViewItem(
                image: widget.books[index].imageUrl ?? '',
              ),
            );
          },
        ),
      ),
    );
  }
}
