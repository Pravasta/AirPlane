import 'package:airplane/cubit/seat_cubit.dart';
import 'package:airplane/models/destination_model.dart';
import 'package:airplane/models/transaction_model.dart';
import 'package:airplane/shared/theme.dart';
import 'package:airplane/ui/pages/checkout_page.dart';
import 'package:airplane/ui/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../widget/seat_item.dart';

class ChooseSeatPage extends StatelessWidget {
  // untuk mengambil data
  final DestinationModel destination;

  const ChooseSeatPage(this.destination, {super.key});

  @override
  Widget build(BuildContext context) {
    Widget title() {
      return Container(
        margin: const EdgeInsets.only(top: 50),
        child: Text(
          'Select Your\nFavorite Seat',
          style: blackTextStyle.copyWith(
            fontSize: 26,
            fontWeight: semiBold,
          ),
        ),
      );
    }

    Widget seatStatus() {
      return Container(
        margin: const EdgeInsets.only(top: 30),
        child: Row(
          children: [
            // Available
            Container(
              width: 18,
              height: 18,
              margin: const EdgeInsets.only(
                left: 10,
                right: 6,
              ),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/icon_available.png'),
                ),
              ),
            ),
            Text(
              'Available',
              style: blackTextStyle.copyWith(
                fontSize: 18,
              ),
            ),
            Container(
              width: 18,
              height: 18,
              margin: const EdgeInsets.only(
                left: 10,
                right: 6,
              ),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/icon_selected.png'),
                ),
              ),
            ),
            Text(
              'Selected',
              style: blackTextStyle.copyWith(
                fontSize: 18,
              ),
            ),
            Container(
              width: 18,
              height: 18,
              margin: const EdgeInsets.only(
                left: 10,
                right: 6,
              ),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/icon_unavailable.png'),
                ),
              ),
            ),
            Text(
              'UnAvailable',
              style: blackTextStyle.copyWith(
                fontSize: 18,
              ),
            ),
            const Text(''),
          ],
        ),
      );
    }

    Widget selectSeat() {
      return BlocBuilder<SeatCubit, List<String>>(
        builder: (context, state) {
          return Container(
            margin: const EdgeInsets.only(top: 30),
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 30),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              color: whiteColor,
            ),
            child: Column(
              children: [
                // SEAT INDICATOR
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      child: Center(
                        child: Text(
                          'A',
                          style: greyTextStyle.copyWith(
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      child: Center(
                        child: Text(
                          'B',
                          style: greyTextStyle.copyWith(
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      child: Center(
                        child: Text(
                          '',
                          style: greyTextStyle.copyWith(
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      child: Center(
                        child: Text(
                          'C',
                          style: greyTextStyle.copyWith(
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      child: Center(
                        child: Text(
                          'D',
                          style: greyTextStyle.copyWith(
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                // NOTE SEAT 1
                Container(
                  margin: const EdgeInsets.only(top: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      SeatItem(
                        id: 'A1',
                        isAvailable: false,
                      ),
                      SeatItem(
                        id: 'B1',
                        isAvailable: false,
                      ),
                      SizedBox(
                        width: 58,
                        height: 58,
                        child: Center(
                          child: Text('1'),
                        ),
                      ),
                      SeatItem(id: 'C1'),
                      SeatItem(id: 'D1'),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      SeatItem(id: 'A2'),
                      SeatItem(id: 'B2'),
                      SizedBox(
                        width: 58,
                        height: 58,
                        child: Center(
                          child: Text('2'),
                        ),
                      ),
                      SeatItem(id: 'C2'),
                      SeatItem(id: 'D2'),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      SeatItem(id: 'A3'),
                      SeatItem(id: 'B3'),
                      SizedBox(
                        width: 58,
                        height: 58,
                        child: Center(
                          child: Text('3'),
                        ),
                      ),
                      SeatItem(id: 'C3'),
                      SeatItem(id: 'D3'),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      SeatItem(id: 'A4'),
                      SeatItem(id: 'B4'),
                      SizedBox(
                        width: 58,
                        height: 58,
                        child: Center(
                          child: Text('4'),
                        ),
                      ),
                      SeatItem(id: 'C4'),
                      SeatItem(id: 'D4'),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      SeatItem(id: 'A5'),
                      SeatItem(id: 'B5'),
                      SizedBox(
                        width: 58,
                        height: 58,
                        child: Center(
                          child: Text('5'),
                        ),
                      ),
                      SeatItem(id: 'C5'),
                      SeatItem(id: 'D5'),
                    ],
                  ),
                ),
                // NOTE: Your Seat
                Container(
                  margin: const EdgeInsets.only(top: 30, right: 15, left: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Your seat',
                        style: greyTextStyle.copyWith(
                          fontWeight: light,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        (state.isEmpty) ? 'Choose your seat' : state.join(', '),
                        style: blackTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: semiBold,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                // NOTE: TOtal
                Container(
                  margin: const EdgeInsets.only(top: 30, right: 15, left: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total',
                        style: greyTextStyle.copyWith(
                          fontWeight: light,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        (state.isEmpty)
                            ? ''
                            : NumberFormat.currency(
                                locale: 'id',
                                symbol: 'Rp. ',
                                decimalDigits: 0,
                              ).format(state.length * destination.price),
                        style: purpleTextStyle.copyWith(
                          fontSize: 18,
                          fontWeight: semiBold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      );
    }

    Widget checkOutButton() {
      return BlocBuilder<SeatCubit, List<String>>(
        builder: (context, state) {
          return CustomButton(
            title: 'Continue to Checkout',
            onPressed: state.isEmpty
                ? () {}
                : () {
                    int price = destination.price * state.length;
                    return Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CheckOutPage(
                          TransactionModel(
                            destination: destination,
                            amountTraveler: state.length,
                            selectedSeat: state.join(', '),
                            insurance: true,
                            refundable: false,
                            vat: 0.45,
                            price: price,
                            grandTotal: price + (price * 0.45).toInt(),
                          ),
                        ),
                      ),
                    );
                  },
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(
              top: 30,
              bottom: 46,
            ),
          );
        },
      );
    }

    return Scaffold(
      backgroundColor: backGroundColor,
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          title(),
          seatStatus(),
          selectSeat(),
          checkOutButton(),
        ],
      ),
    );
  }
}
