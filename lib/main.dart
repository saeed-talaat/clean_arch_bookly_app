import 'package:clean_artc_bookly_app/constants.dart';
import 'package:clean_artc_bookly_app/core/services/get_it.dart';
import 'package:clean_artc_bookly_app/core/utils/app_colors.dart';
import 'package:clean_artc_bookly_app/core/utils/app_router.dart';
import 'package:clean_artc_bookly_app/core/utils/simple_bloc_observer.dart';
import 'package:clean_artc_bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:clean_artc_bookly_app/features/home/domain/use_cases/fetch_featured_books_use_case.dart';
import 'package:clean_artc_bookly_app/features/home/domain/use_cases/fetch_newset_books_use_case.dart';
import 'package:clean_artc_bookly_app/features/home/presentation/manger/featured_books_cubit/featured_books_cubit.dart';
import 'package:clean_artc_bookly_app/features/home/presentation/manger/newset_books_cubits/newset_books_cubit.dart';
import 'package:clean_artc_bookly_app/features/search/domain/use_cases/search_books_use_case.dart';
import 'package:clean_artc_bookly_app/features/search/presentation/manger/search_cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(BookEntityAdapter());
  await Hive.openBox<BookEntity>(kFeaturedBox);
  await Hive.openBox<BookEntity>(kNewestBox);
  await Hive.openBox<BookEntity>(kSearchBox);
  getItInit();
  Bloc.observer = SimpleBlocObserver();
  runApp(const BooklyAppCleanArch());
}

class BooklyAppCleanArch extends StatelessWidget {
  const BooklyAppCleanArch({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FeaturedBooksCubit(
            featuredBooksUseCase: geIt<FetchFeaturedBooksUseCase>(),
          )..fetchFeaturedBooks(),
        ),

        BlocProvider(
          create: (context) => NewsetBooksCubit(
            fetchNewsetBooksUseCase: geIt<FetchNewsetBooksUseCase>(),
          )..fetchNewsetBooks(),
        ),

        BlocProvider(
          create: (context) => SearchCubit(
            searchBooksUseCase: geIt<SearchBooksUseCase>(),
          ),
        ),
      ],
      child: MaterialApp.router(
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: AppColors.kPrimaryColor,
          textTheme: GoogleFonts.montserratTextTheme(
            ThemeData.dark().textTheme,
          ),
        ),

        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
