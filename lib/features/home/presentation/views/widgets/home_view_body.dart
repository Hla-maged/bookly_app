import 'package:bookly_app/core/helper/styles.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/BS_listview.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/books_listview.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: CustomAppBar(),
            ),
            BooksListView(),
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Newest',
                style: Styles.textStyle18,
              ),
            ),
            SizedBox(
              height: 10,
            ),
          ]),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: BSListView(),
          ),
        )
      ],
    );
  }
}
