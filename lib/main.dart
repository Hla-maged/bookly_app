import 'package:bookly_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'core/helper/app_router.dart';
import 'core/helper/service_locator.dart';
import 'features/home/data/repos/home_repo_implement.dart';
import 'features/home/presentation/manager/BooksCubit/books_cubit.dart';
import 'features/home/presentation/manager/NewestBooksCubit/newest_books_cubit.dart';

void main() {
  setUp();
  runApp(const BooklyApp());
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => BooksCubit(getIt.get<HomeRepoImplement>())
              ..fetchBooksListView()),
        BlocProvider(
            create: (context) =>
                NewestBooksCubit(getIt.get<HomeRepoImplement>())..fetchNewestListView()),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        theme: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: KPrimaryColor,
            textTheme:
                GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme)),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
