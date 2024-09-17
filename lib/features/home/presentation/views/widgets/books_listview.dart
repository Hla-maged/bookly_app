import 'package:bookly_app/core/widgets/custom_loading_indicator.dart';
import 'package:bookly_app/core/widgets/cutsom_error.dart';
import 'package:bookly_app/features/home/presentation/manager/BooksCubit/books_cubit.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/listview_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class BooksListView extends StatelessWidget {
  const BooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BooksCubit, BooksState>(
      builder: (context, state) {
        if (state is BooksSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * .3,
            child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: state.books.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: GestureDetector(
                      onTap: () {
                        GoRouter.of(context)
                            .push('/bookDetails', extra: state.books[index]);
                      },
                      child: ListViewItem(
                        image: state.books[index].volumeInfo?.imageLinks
                                ?.thumbnail ??
                            '',
                      ),
                    ),
                  );
                }),
          );
        } else if (state is BooksFailure) {
          return CustomError(error: state.error);
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
