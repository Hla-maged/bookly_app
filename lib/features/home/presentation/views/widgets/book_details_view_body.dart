import 'package:bookly_app/constants.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:flutter/material.dart';

import '../../../../../core/helper/styles.dart';
import 'action_buttons.dart';
import 'custom_bookDetails_app_bar.dart';
import 'detailed_list_view.dart';
import 'listview_item.dart';
import 'rating_books.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key, required this.bookModel});
  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CustomBookDetailsAppBar(),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.2),
              child: ListViewItem(
                image: bookModel.volumeInfo?.imageLinks?.thumbnail ?? '',
              ),
            ),
            const SizedBox(height: 30),
            Center(
              child: Text(
                bookModel.volumeInfo?.title ?? '',
                maxLines: 2,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: Styles.textStyle30.copyWith(
                    fontFamily: kGtSectraFine, fontWeight: FontWeight.w500),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              bookModel.volumeInfo?.authors?[0] ?? '',
              style: Styles.textStyle16,
            ),
            const SizedBox(
              height: 15,
            ),
            const RatingBooks(
              rating: '4.5',
              mainAxisAlignment: MainAxisAlignment.center,
            ),
            const SizedBox(
              height: 10,
            ),
            ActionButtons(bookModel: bookModel),
            const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'You can also like',
                  style: TextStyle(
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                      fontSize: 17),
                )),
            const SizedBox(
              height: 15,
            ),
            const DetailedListView(),
          ],
        ),
      ),
    );
  }
}
