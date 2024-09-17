import 'package:bookly_app/constants.dart';
import 'package:bookly_app/core/helper/styles.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/listview_item.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/rating_books.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BSListViewItem extends StatelessWidget {
  const BSListViewItem({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push('/bookDetails', extra: bookModel);
      },
      child: SizedBox(
        height: 125,
        child: Row(children: [
          ListViewItem(image: bookModel.volumeInfo?.imageLinks?.thumbnail ?? ''),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: Text(
                    bookModel.volumeInfo?.title??'',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style:
                        Styles.textStyle18.copyWith(fontFamily: kGtSectraFine),
                  ),
                ),
                const SizedBox(
                  height: 3,
                ),
                Text(
                  bookModel.volumeInfo?.authors?[0]??'',
                  maxLines: 1,
                   overflow: TextOverflow.ellipsis,
                  style: Styles.textStyle14,
                ),
                Row(
                  children: [
                    Text('Free',
                        style: Styles.textStyle20
                            .copyWith(fontWeight: FontWeight.bold)),
                    const Spacer(),
                    RatingBooks(
                      rating: bookModel.volumeInfo?.maturityRating??'',
                    ),
                  ],
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}
