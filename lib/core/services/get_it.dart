import 'package:clean_artc_bookly_app/core/utils/api_service.dart';
import 'package:clean_artc_bookly_app/features/home/data/data_sources/home_local_data_sources.dart';
import 'package:clean_artc_bookly_app/features/home/data/data_sources/home_remote_data_sources.dart';
import 'package:clean_artc_bookly_app/features/home/data/repos/home_repo_imple.dart';
import 'package:clean_artc_bookly_app/features/home/domain/repos/home_repo.dart';
import 'package:clean_artc_bookly_app/features/home/domain/use_cases/fetch_featured_books_use_case.dart';
import 'package:clean_artc_bookly_app/features/home/domain/use_cases/fetch_newset_books_use_case.dart';
import 'package:clean_artc_bookly_app/features/search/data/data_sources/search_local_data_sources.dart';
import 'package:clean_artc_bookly_app/features/search/data/data_sources/search_remote_data_sources.dart';
import 'package:clean_artc_bookly_app/features/search/data/repos/search_repo_imple.dart';
import 'package:clean_artc_bookly_app/features/search/domain/repos/search_repo.dart';
import 'package:clean_artc_bookly_app/features/search/domain/use_cases/search_books_use_case.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final GetIt geIt = GetIt.instance;

void getItInit() {
  geIt.registerSingleton<Dio>(Dio());
  geIt.registerSingleton<ApiService>(ApiService(dio: geIt<Dio>()));
  geIt.registerSingleton<HomeLocalDataSources>(HomeLocalDataSourcesImple());
  geIt.registerSingleton<HomeRemoteDataSources>(
    HomeRemoteDataSourcesImple(apiService: geIt<ApiService>()),
  );
  geIt.registerSingleton<HomeRepo>(
    HomeRepoImple(
      homeRemoteDataSources: geIt<HomeRemoteDataSources>(),
      homeLocalDataSources: geIt<HomeLocalDataSources>(),
    ),
  );
  geIt.registerSingleton<FetchFeaturedBooksUseCase>(
    FetchFeaturedBooksUseCase(homeRepo: geIt<HomeRepo>()),
  );

  geIt.registerSingleton<FetchNewsetBooksUseCase>(
    FetchNewsetBooksUseCase(homeRepo: geIt<HomeRepo>()),
  );

  // Search
  geIt.registerSingleton<SearchLocalDataSources>(
    SearchLocalDataSourcesImple(),
  );
  geIt.registerSingleton<SearchRemoteDataSources>(
    SearchRemoteDataSourcesImple(apiService: geIt<ApiService>()),
  );
  geIt.registerSingleton<SearchRepo>(
    SearchRepoImple(
      searchRemoteDataSources: geIt<SearchRemoteDataSources>(),
      searchLocalDataSources: geIt<SearchLocalDataSources>(),
    ),
  );
  geIt.registerSingleton<SearchBooksUseCase>(
    SearchBooksUseCase(searchRepo: geIt<SearchRepo>()),
  );
}
