import 'package:clean_artc_bookly_app/core/utils/app_styles.dart';
import 'package:clean_artc_bookly_app/features/home/presentation/manger/newset_books_cubits/newset_books_cubit.dart';
import 'package:clean_artc_bookly_app/features/home/presentation/views/widgets/custom_home_app_bar.dart';
import 'package:clean_artc_bookly_app/features/home/presentation/views/widgets/featured_list_view_bloc_builder.dart';
import 'package:clean_artc_bookly_app/features/home/presentation/views/widgets/newset_list_view_bloc_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  late final ScrollController _scrollController;
  bool _isLoadingMore = false;
  int _nextPage = 1;

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
      context.read<NewsetBooksCubit>().fetchNewsetBooks(
        pageNumber: _nextPage,
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
    return BlocListener<NewsetBooksCubit, NewsetBooksState>(
      listener: (context, state) {
        if (state is NewsetBooksSuccess) {
          _nextPage++;
          _isLoadingMore = false;
        } else if (state is NewsetBooksPaginationFailure) {
          _isLoadingMore = false;
        }
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 30),
        child: CustomScrollView(
          controller: _scrollController,
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomHomeAppBar(),
                  SizedBox(height: 32),
                  FeaturedListViewBlocBuilder(),
                  SizedBox(height: 50),
                  Text(
                    'Best Seller',
                    style: AppStyles.textStyle20.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  SizedBox(height: 16),
                ],
              ),
            ),
            NewsetListViewBlocBuilder()
          ],
        ),
      ),
    );
  }
}
