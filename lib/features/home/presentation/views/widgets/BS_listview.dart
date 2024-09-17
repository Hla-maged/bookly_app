import 'package:bookly_app/core/widgets/custom_loading_indicator.dart';
import 'package:bookly_app/core/widgets/cutsom_error.dart';
import 'package:bookly_app/features/home/presentation/manager/NewestBooksCubit/newest_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/BS_listview_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BSListView extends StatelessWidget {
  const BSListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit, NewestBooksState>(
      builder: (context, state) {
        if (state is NewestBooksSuccess) {
          return ListView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: state.books.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: BSListViewItem(bookModel: state.books[index]),
                );
              });
        } else if (state is NewestBooksFailure) {
          return CustomError(error: state.error);
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
