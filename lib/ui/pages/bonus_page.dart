import 'package:airplane/cubit/auth_cubit.dart';
import 'package:airplane/ui/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../shared/theme.dart';

class BonusPage extends StatelessWidget {
  const BonusPage({super.key});

  @override
  Widget build(BuildContext context) {
    Widget bonusCard() {
      return BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          if (state is AuthSucces) {
            return Container(
              padding: EdgeInsets.all(defaultMargin),
              width: 300,
              height: 211,
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage('assets/image_card.png'),
                ),
                boxShadow: [
                  BoxShadow(
                    color: primaryColor.withOpacity(0.5),
                    blurRadius: 50,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Name',
                              style: whiteTextStyle.copyWith(
                                fontWeight: light,
                              ),
                            ),
                            Text(
                              state.user.name,
                              style: whiteTextStyle.copyWith(
                                fontSize: 20,
                                fontWeight: medium,
                              ),
                            )
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            width: 24,
                            height: 24,
                            margin: const EdgeInsets.only(right: 6),
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/icon_plane.png'),
                              ),
                            ),
                          ),
                          Text(
                            'Pay',
                            style: whiteTextStyle.copyWith(
                              fontSize: 16,
                              fontWeight: medium,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 41),
                  Text(
                    'Balanced',
                    style: whiteTextStyle.copyWith(
                        fontWeight: light, fontSize: 14),
                  ),
                  Text(
                    '${state.user.balance}',
                    style: whiteTextStyle.copyWith(
                        fontWeight: medium, fontSize: 26),
                  ),
                ],
              ),
            );
          } else {
            return const SizedBox();
          }
        },
      );
    }

    Widget title(String text, TextStyle textStyle, double margin) {
      return Container(
        margin: EdgeInsets.only(top: margin),
        child: Text(
          text,
          style: textStyle,
          textAlign: TextAlign.center,
        ),
      );
    }

    return Scaffold(
      backgroundColor: backGroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            bonusCard(),
            title(
              'Big Bonus 🎉',
              blackTextStyle.copyWith(
                fontSize: 32,
                fontWeight: semiBold,
              ),
              80,
            ),
            title(
              'We give you  early credit so that\nyou can buy a flight ticket',
              greyTextStyle.copyWith(
                fontSize: 16,
                fontWeight: light,
              ),
              10,
            ),
            submitButton(context)
          ],
        ),
      ),
    );
  }

  Widget submitButton(BuildContext context) {
    return CustomButton(
      width: MediaQuery.of(context).size.width / 2,
      onPressed: () => Navigator.pushNamedAndRemoveUntil(
          context, '/main-page', (route) => false),
      title: 'Start Fly Now',
      margin: const EdgeInsets.only(top: 50),
    );
  }
}
