import 'package:airplane/cubit/page_cubit.dart';
import 'package:airplane/shared/theme.dart';
import 'package:airplane/ui/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SuccessCheckoutPage extends StatelessWidget {
  const SuccessCheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backGroundColor,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 300,
                height: 150,
                margin: const EdgeInsets.only(bottom: 80),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/image_success.png'),
                  ),
                ),
              ),
              Text(
                'Well Booked',
                style: blackTextStyle.copyWith(
                  fontSize: 34,
                  fontWeight: semiBold,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Are you ready to explore the new\nworld of experiences',
                style: greyTextStyle.copyWith(
                  fontSize: 18,
                  fontWeight: light,
                ),
                textAlign: TextAlign.center,
              ),
              CustomButton(
                width: 220,
                onPressed: () {
                  context.read<PageCubit>().setPage(1);
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    '/main-page',
                    (route) => false,
                  );
                },
                title: 'My Bookings',
                margin: const EdgeInsets.only(top: 50),
              ),
            ],
          ),
        ));
  }
}
