import 'package:clean_artc_bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:clean_artc_bookly_app/features/home/presentation/views/widgets/best_seller_item.dart';
import 'package:flutter/material.dart';

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key, required this.books});
  final List<BookEntity> books;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: books.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: NewestItem(bookEntity: books[index],),
        );
      },
    );
  }
}
