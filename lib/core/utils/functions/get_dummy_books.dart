import 'package:clean_artc_bookly_app/features/home/domain/entities/book_entity.dart';

List<BookEntity> getDummyBooksList({int count = 25}) {
  return List.generate(
    count,
    (index) => BookEntity(
      bookId: 'book_id_$index',
      imageUrl: 'https://picsum.photos/200/300?random=$index',
      title: 'عنوان الكتاب رقم $index',
      authorName: 'اسم المؤلف $index',
      price: 100.0 + (index * 5), 
      rating: 4.0 + (index % 10) / 10, 
    ),
  );
}