import 'package:flutter/widgets.dart';

class CustomError extends StatelessWidget {
  const CustomError({super.key, required this.error});
  final String error;
  @override
  Widget build(BuildContext context) {
    return Text(error);
  }
}
