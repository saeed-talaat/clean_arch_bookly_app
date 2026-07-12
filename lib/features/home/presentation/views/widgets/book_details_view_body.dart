import 'package:clean_artc_bookly_app/core/utils/app_styles.dart';
import 'package:clean_artc_bookly_app/features/home/presentation/views/widgets/book_details_section.dart';
import 'package:clean_artc_bookly_app/features/home/presentation/views/widgets/custom_book_details_app_bar.dart';
import 'package:clean_artc_bookly_app/features/home/presentation/views/widgets/simllar_books_list_view.dart';
import 'package:flutter/material.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              children: [
                CustomBookDetailsAppBar(),
                BookDetailsSection(),
                Spacer(flex: 3),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'You can also like',
                    style: AppStyles.textStyle14.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Spacer(flex: 1),
                SimllarBooksListView(),
                Spacer(flex: 1),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
