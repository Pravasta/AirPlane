import 'package:airplane/cubit/page_cubit.dart';
import 'package:airplane/ui/pages/home_page.dart';
import 'package:airplane/ui/pages/settings_page.dart';
import 'package:airplane/ui/pages/transaction_page.dart';
import 'package:airplane/ui/pages/wallet_page.dart';
import 'package:airplane/ui/widget/custom_bottom_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../shared/theme.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    Widget buildContent(int currentIndex) {
      switch (currentIndex) {
        case 0:
          return const HomePage();
        case 1:
          return const TransactionPage();
        case 2:
          return const WalletPage();
        case 3:
          return const SettingsPage();
        default:
          return const HomePage();
      }
    }

    Widget customBottomNav() {
      return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          margin: EdgeInsets.only(
              bottom: 30, left: defaultMargin, right: defaultMargin),
          width: double.infinity,
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            color: whiteColor,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomBottomNavigation(
                index: 0,
                image: 'assets/icon_home.png',
              ),
              CustomBottomNavigation(
                index: 1,
                image: 'assets/icon_booking.png',
              ),
              CustomBottomNavigation(
                index: 2,
                image: 'assets/icon_card.png',
              ),
              CustomBottomNavigation(
                index: 3,
                image: 'assets/icon_settings.png',
              ),
            ],
          ),
        ),
      );
    }

    return BlocBuilder<PageCubit, int>(
      builder: (context, currentIndex) {
        return Scaffold(
          backgroundColor: backGroundColor,
          body: Stack(
            children: [
              buildContent(currentIndex),
              customBottomNav(),
            ],
          ),
        );
      },
    );
  }
}
