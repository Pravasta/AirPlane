import 'package:flutter/material.dart';

import '../../shared/theme.dart';

class InterestWidget extends StatelessWidget {
  final String text;
  const InterestWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(right: 6),
            width: 18,
            height: 18,
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  'assets/icon_check.png',
                ),
              ),
            ),
          ),
          Text(
            text,
            style: blackTextStyle.copyWith(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
