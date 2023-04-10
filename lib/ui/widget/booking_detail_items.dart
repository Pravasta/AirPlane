import 'package:flutter/material.dart';

import '../../shared/theme.dart';

class BookingDetailsItem extends StatelessWidget {
  final String title;
  final String valueText;
  final Color valueColor;
  const BookingDetailsItem({
    super.key,
    required this.title,
    required this.valueText,
    required this.valueColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      child: Row(
        children: [
          Container(
            width: 18,
            height: 18,
            margin: const EdgeInsets.only(right: 8),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/icon_check.png'),
              ),
            ),
          ),
          Text(
            title,
            style: blackTextStyle.copyWith(fontSize: 16),
          ),
          const Spacer(),
          Text(
            valueText,
            style: blackTextStyle.copyWith(
              fontWeight: semiBold,
              fontSize: 16,
              color: valueColor,
            ),
          ),
        ],
      ),
    );
  }
}
