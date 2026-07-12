import 'package:clean_artc_bookly_app/constants.dart';
import 'package:clean_artc_bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:hive_flutter/hive_flutter.dart';

abstract class HomeLocalDataSources {
  List<BookEntity> fetchFeaturedBooks();
  List<BookEntity> fetchNewsetBooks();
}

class HomeLocalDataSourcesImple implements HomeLocalDataSources {
  @override
  List<BookEntity> fetchFeaturedBooks() {
    var box = Hive.box<BookEntity>(kFeaturedBox);
    List<BookEntity> books = box.values.toList();
    return books;
  }

  @override
  List<BookEntity> fetchNewsetBooks() {
    var box = Hive.box<BookEntity>(kNewestBox);
    List<BookEntity> books = box.values.toList();
    return books;
  }
}
