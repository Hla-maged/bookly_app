import 'package:bookly_app/core/helper/launch_url.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:flutter/material.dart';
import '../../../../../core/widgets/custom_button.dart';

class ActionButtons extends StatelessWidget {
  const ActionButtons({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: CustomButton(
            text: 'Free',
            backGroundColor: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12), bottomLeft: Radius.circular(12)),
            textColor: Colors.black,
          ),
        ),
        Expanded(
          child: CustomButton(
            onPressed: () {
              LaunchUrl(context, bookModel.volumeInfo?.previewLink!);
            },
            text: 'Preview',
            backGroundColor: Colors.pink,
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(12),
                bottomRight: Radius.circular(12)),
            textColor: Colors.white,
          ),
        ),
      ],
    );
  }
}
