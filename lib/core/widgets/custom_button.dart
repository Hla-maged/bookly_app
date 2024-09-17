import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.backGroundColor,
      required this.textColor,
      required this.borderRadius,
      this.onPressed,
      required this.text});
  final Color backGroundColor;
  final Color textColor;
  final BorderRadius borderRadius;
  final String text;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: Row(
        children: [
          Expanded(
            child: TextButton(
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(borderRadius: borderRadius),
                backgroundColor: backGroundColor,
              ),
              onPressed: onPressed,
              child: Text(
                text,
                style: TextStyle(
                    color: textColor,
                    fontWeight: FontWeight.w900,
                    fontSize: 16),
              ),
            ),
          )
        ],
      ),
    );
  }
}
