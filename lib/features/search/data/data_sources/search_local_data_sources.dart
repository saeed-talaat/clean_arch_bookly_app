import 'package:clean_artc_bookly_app/constants.dart';
import 'package:clean_artc_bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:hive_flutter/hive_flutter.dart';

abstract class SearchLocalDataSources {
  List<BookEntity> searchBooks({required String query});
}

class SearchLocalDataSourcesImple implements SearchLocalDataSources {
  @override
  List<BookEntity> searchBooks({required String query}) {
    var box = Hive.box<BookEntity>(kSearchBox);
    List<BookEntity> allBooks = box.values.toList();
    if (query.isEmpty) {
      return allBooks;
    }
    String lowerQuery = query.toLowerCase();
    List<BookEntity> filteredBooks = allBooks.where((book) {
      final titleMatch = book.title.toLowerCase().contains(lowerQuery);
      final authorMatch =
          book.authorName?.toLowerCase().contains(lowerQuery) ?? false;
      return titleMatch || authorMatch;
    }).toList();
    return filteredBooks;
  }
}
