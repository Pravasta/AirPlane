import 'dart:math';

import 'package:airplane/cubit/seat_cubit.dart';
import 'package:airplane/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SeatItem extends StatelessWidget {
  /*
  0 = Available
  1 = Selected
  2 = UnAvailable
  */

  final bool isAvailable;

  final String id;

  // udh gk butuh karena diganti dengan yang ada di seat cubit
  // final int status;
  const SeatItem({
    super.key,
    this.isAvailable = true,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    // Ini untuk mengubah switcCase
    bool isSelected = context.watch<SeatCubit>().isSelected(id);

    // Beda watch dan read
    // kalau watch untuk memantau secara real seperti di klik berubah seniri, kalau read hanya sekali

    colorBackground() {
      // Jika isAvailable == tidak
      if (!isAvailable) {
        return unavailableColor;
      } else {
        // Jika dia sedang dipilih maka diubah ke primary color
        if (isSelected) {
          return primaryColor;
        } else {
          return availableColor;
        }
      }
      // switch (status) {
      //   case 0:
      //     return availableColor;
      //   case 1:
      //     return primaryColor;
      //   case 2:
      //     return unavailableColor;
      //   default:
      //     return unavailableColor;
      // }
    }

    borderColor() {
      if (!isAvailable) {
        return unavailableColor;
      } else {
        return primaryColor;
      }
      // switch (status) {
      //   case 0:
      //     return primaryColor;
      //   case 1:
      //     return primaryColor;
      //   case 2:
      //     return unavailableColor;
      //   default:
      //     return unavailableColor;
      // }
    }

    child() {
      // Jika dia select maka ubah ke beri tulisa YOU
      if (isSelected) {
        return Center(
          child: Text(
            'YOU',
            style: whiteTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
        );
      } else {
        return const SizedBox();
      }
      // switch (status) {
      //   case 0:
      //     return const SizedBox();
      //   case 1:
      //     return Center(
      //       child: Text(
      //         'YOU',
      //         style: whiteTextStyle.copyWith(
      //           fontSize: 16,
      //           fontWeight: semiBold,
      //         ),
      //       ),
      //     );
      //   case 2:
      //     const SizedBox();
      //     break;
      //   default:
      //     return const SizedBox();
    }

    return GestureDetector(
      onTap: () {
        if (isAvailable) {
          context.read<SeatCubit>().selectSeat(id);
        }
      },
      child: Container(
        width: 58,
        height: 58,
        decoration: BoxDecoration(
          color: colorBackground(),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: borderColor(),
            width: 2,
          ),
        ),
        child: child(),
      ),
    );
  }
}
