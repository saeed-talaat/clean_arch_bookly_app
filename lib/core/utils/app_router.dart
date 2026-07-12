import 'package:clean_artc_bookly_app/features/home/presentation/views/book_details_view.dart';
import 'package:clean_artc_bookly_app/features/home/presentation/views/home_view.dart';
import 'package:clean_artc_bookly_app/features/search/presentation/views/search_view.dart';
import 'package:clean_artc_bookly_app/features/splash/presentation/views/splash_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const splashViewRouter = '/SplashView';
  static const homeViewRouter = '/HomeView';
  static const bookDetailsViewRouter = '/BookDetailsView';
  static const searchViewRouter = '/searchView';

  static final GoRouter router = GoRouter(
    initialLocation: splashViewRouter,
    routes: [
      GoRoute(
        path: splashViewRouter,
        builder: (context, state) => const SplashView(),
      ),

      GoRoute(
        path: homeViewRouter,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            child: const HomeView(),
            transitionDuration: const Duration(milliseconds: 500),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
                  return FadeTransition(
                    opacity: CurveTween(
                      curve: Curves.easeInOut,
                    ).animate(animation),
                    child: child,
                  );
                },
          );
        },
      ),

      GoRoute(
        path: bookDetailsViewRouter,
        builder: (context, state) => const BookDetailsView(),
      ),

      GoRoute(
        path: searchViewRouter,
        builder: (context, state) => const SearchView(),
      ),
    ],
  );
}
