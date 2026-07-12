import 'package:clean_artc_bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:hive/hive.dart';

void saveBoxData(List<BookEntity> books, String boxName) {
    var box = Hive.box<BookEntity>(boxName);
    box.addAll(books);
  }