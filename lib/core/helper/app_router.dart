import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/data/repos/home_repo_implement.dart';
import 'package:bookly_app/features/home/presentation/manager/SimilarBooksCubit/similar_books_cubit.dart';
import 'package:bookly_app/features/search/data/repos/search_repo_implement.dart';
import 'package:bookly_app/features/search/presentation/manager/cubit/search_books_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../features/home/presentation/views/book_details_view.dart';
import '../../features/home/presentation/views/home_view.dart';
import '../../features/search/presentation/views/search_view.dart';
import '../../features/splash/presentation/views/splash_view.dart';
import 'service_locator.dart';

abstract class AppRouter {
  static final router = GoRouter(routes: [
    GoRoute(path: '/', builder: (context, state) => const SplashView()),
    GoRoute(
        path: '/search',
        builder: (context, state) => BlocProvider(
              create: (context) =>
                  SearchBooksCubit(getIt.get<SearchRepoImplement>()),
              child: const SearchView(),
            )),
    GoRoute(path: '/home', builder: (context, state) => const HomeView()),
    GoRoute(
        path: '/bookDetails',
        builder: (context, state) => BlocProvider(
              create: (context) =>
                  SimilarBooksCubit(getIt.get<HomeRepoImplement>()),
              child: BookDetailsView(
                bookModel: state.extra as BookModel,
              ),
            ))
  ]);
}
