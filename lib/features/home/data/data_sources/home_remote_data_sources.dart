import 'package:clean_artc_bookly_app/constants.dart';
import 'package:clean_artc_bookly_app/core/utils/api_service.dart';
import 'package:clean_artc_bookly_app/core/utils/functions/save_box.dart';
import 'package:clean_artc_bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:clean_artc_bookly_app/features/home/domain/entities/book_entity.dart';

abstract class HomeRemoteDataSources {
  Future<List<BookEntity>> fetchFeaturedBooks({int pageNumber = 0});
  Future<List<BookEntity>> fetchNewsetBooks();
}

class HomeRemoteDataSourcesImple implements HomeRemoteDataSources {
  final ApiService _apiService;

  HomeRemoteDataSourcesImple({required this._apiService});
  @override
  Future<List<BookEntity>> fetchFeaturedBooks({int pageNumber = 0}) async {
    var data = await _apiService.get(
      endpoint: 'volumes?q=programming&filter=free-ebooks&startIndex=${pageNumber * 10}',
    );
    List<BookEntity> books = _getBooksList(data);
    saveBoxData(books, kFeaturedBox);
    return books;
  }

  @override
  Future<List<BookEntity>> fetchNewsetBooks() async {
    var data = await _apiService.get(
      endpoint: 'volumes?q=programming&filter=free-ebooks&orderBy=newest&startIndex=10'
    );
    List<BookEntity> books = _getBooksList(data);
    saveBoxData(books, kNewestBox);
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
