import 'package:flutter/material.dart';

import '../../shared/theme.dart';

class CustomButton extends StatelessWidget {
  final double width;
  final Function() onPressed;
  final String title;
  final EdgeInsets margin;
  const CustomButton({
    super.key,
    required this.width,
    required this.onPressed,
    required this.title,
    this.margin = EdgeInsets.zero,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      width: width,
      height: 70,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(defaultRadius),
          ),
        ),
        child: Text(
          title,
          style: whiteTextStyle.copyWith(
            fontSize: 18,
            fontWeight: medium,
          ),
        ),
      ),
    );
  }
}
