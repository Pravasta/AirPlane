import 'package:airplane/cubit/page_cubit.dart';
import 'package:airplane/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomBottomNavigation extends StatelessWidget {
  final String image;
  final int index;
  const CustomBottomNavigation({
    super.key,
    required this.image,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        return context.read<PageCubit>().setPage(index);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(),
          Image.asset(
            image,
            width: 24,
            height: 24,
            color: context.read<PageCubit>().state == index
                ? primaryColor
                : greyColor,
          ),
          Container(
            height: 2,
            width: 30,
            decoration: BoxDecoration(
              color: context.read<PageCubit>().state == index
                  ? primaryColor
                  : transparanColor,
              borderRadius: BorderRadius.circular(18),
            ),
          ),
        ],
      ),
    );
  }
}
