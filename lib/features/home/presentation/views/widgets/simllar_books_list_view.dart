import 'package:clean_artc_bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:clean_artc_bookly_app/features/home/presentation/views/widgets/book_image.dart';
import 'package:flutter/material.dart';

class SimllarBooksListView extends StatelessWidget {
  const SimllarBooksListView({super.key, required this.books});
  final List<BookEntity> books;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.15,
      child: ListView.builder(
        padding: EdgeInsets.zero,
        scrollDirection: Axis.horizontal,
        itemCount: books.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.only(right: 8),
            child: BookImage(image: books[index].imageUrl ?? '',),
          );
        },
      ),
    );
  }
}
