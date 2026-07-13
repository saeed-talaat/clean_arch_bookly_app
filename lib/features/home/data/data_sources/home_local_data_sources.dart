import 'package:clean_artc_bookly_app/constants.dart';
import 'package:clean_artc_bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:hive_flutter/hive_flutter.dart';

abstract class HomeLocalDataSources {
  List<BookEntity> fetchFeaturedBooks({int pageNumber = 0});
  List<BookEntity> fetchNewsetBooks({int pageNumber = 0});
}

class HomeLocalDataSourcesImple implements HomeLocalDataSources {
  @override
  List<BookEntity> fetchFeaturedBooks({int pageNumber = 0}) {
    int startIndex = pageNumber * 10;
    var box = Hive.box<BookEntity>(kFeaturedBox);
    int length = box.values.length;
    if (startIndex >= length) {
      return [];
    }
    int endIndex = (startIndex + 10).clamp(0, length);
    List<BookEntity> books = box.values.toList().sublist(startIndex, endIndex);
    return books;
  }

  @override
  List<BookEntity> fetchNewsetBooks({int pageNumber = 0}) {
    int startIndex = pageNumber * 10;

    var box = Hive.box<BookEntity>(kNewestBox);
    int length = box.values.length;
    if (startIndex >= length) {
      return [];
    }
    int endIndex = (startIndex + 10).clamp(0, length);
    List<BookEntity> books = box.values.toList().sublist(startIndex, endIndex);
    return books;
  }
}
