import 'package:bookly_app/core/widgets/custom_loading_indicator.dart';
import 'package:bookly_app/core/widgets/cutsom_error.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/BS_listview_item.dart';
import 'package:bookly_app/features/search/presentation/manager/cubit/search_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchResultList extends StatelessWidget {
  const SearchResultList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBooksCubit, SearchState>(
      builder: (context, state) {
        if (state is SearchSuccess) {
          return ListView.builder(
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.zero,
              itemCount: state.books.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: BSListViewItem(bookModel: state.books[index]),
                );
              });
        } else if (state is SearchFailure) {
          return CustomError(error: state.error);
        } else if (state is SearchInitial) {
          return const Center(child: Text('Search Now!'));
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
