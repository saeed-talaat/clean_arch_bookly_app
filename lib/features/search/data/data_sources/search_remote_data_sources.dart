import 'package:clean_artc_bookly_app/constants.dart';
import 'package:clean_artc_bookly_app/core/utils/api_service.dart';
import 'package:clean_artc_bookly_app/core/utils/functions/save_box.dart';
import 'package:clean_artc_bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:clean_artc_bookly_app/features/home/domain/entities/book_entity.dart';

abstract class SearchRemoteDataSources {
  Future<List<BookEntity>> searchBooks({
    required String query,
    int pageNumber = 0,
  });
}

class SearchRemoteDataSourcesImple implements SearchRemoteDataSources {
  final ApiService _apiService;

  SearchRemoteDataSourcesImple({required this._apiService});

  @override
  Future<List<BookEntity>> searchBooks({
    required String query,
    int pageNumber = 0,
  }) async {
    var data = await _apiService.get(
      endpoint:
          'volumes?q=$query&filter=free-ebooks&startIndex=${pageNumber * 10}',
    );
    List<BookEntity> books = _getBooksList(data);
    saveBoxData(books, kSearchBox);
    return books;
  }

  List<BookEntity> _getBooksList(Map<String, dynamic> data) {
    List<BookEntity> books = [];
    if (data['items'] != null) {
      for (var item in data['items']) {
        books.add(BookModel.fromJson(item).toEntity());
      }
    }
    return books;
  }
}
