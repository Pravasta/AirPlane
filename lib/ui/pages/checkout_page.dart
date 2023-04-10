import 'package:airplane/cubit/auth_cubit.dart';
import 'package:airplane/cubit/transaction_cubit.dart';
import 'package:airplane/models/transaction_model.dart';
import 'package:airplane/shared/theme.dart';
import 'package:airplane/ui/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../widget/booking_detail_items.dart';

class CheckOutPage extends StatelessWidget {
  final TransactionModel transaction;

  const CheckOutPage(this.transaction, {super.key});

  @override
  Widget build(BuildContext context) {
    Widget route() {
      return Container(
        margin: const EdgeInsets.only(top: 50),
        child: Column(
          children: [
            Container(
              width: 291,
              height: 65,
              margin: const EdgeInsets.only(bottom: 10),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/image_checkout.png'),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'CGK',
                      style: blackTextStyle.copyWith(
                        fontSize: 24,
                        fontWeight: semiBold,
                      ),
                    ),
                    Text(
                      'Tangerang',
                      style: greenTextStyle.copyWith(
                        fontWeight: light,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'TLC',
                      style: blackTextStyle.copyWith(
                        fontSize: 24,
                        fontWeight: semiBold,
                      ),
                    ),
                    Text(
                      'Ciliwung',
                      style: greenTextStyle.copyWith(
                        fontWeight: light,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      );
    }

    Widget bookingDetail() {
      return Container(
        margin: const EdgeInsets.only(top: 30),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: whiteColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // NOTE: Destination Tile
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 16),
                  width: 90,
                  height: 90,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        transaction.destination.imageUrl,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        transaction.destination.name,
                        style: blackTextStyle.copyWith(
                          fontSize: 20,
                          fontWeight: medium,
                        ),
                      ),
                      Text(
                        transaction.destination.city,
                        style: greyTextStyle.copyWith(
                          fontWeight: light,
                          fontSize: 16,
                        ),
                      )
                    ],
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 20,
                      height: 24,
                      margin: const EdgeInsets.only(right: 2),
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/icon_star.png'),
                        ),
                      ),
                    ),
                    Text(
                      '${transaction.destination.rating}',
                      style: blackTextStyle.copyWith(
                        fontWeight: medium,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ],
            ),

            // NOTE: Booking Details
            Container(
              margin: const EdgeInsets.only(top: 20),
              child: Text(
                'Booking Details',
                style: blackTextStyle.copyWith(
                  fontSize: 18,
                  fontWeight: semiBold,
                ),
              ),
            ),

            // NOTE: Booking detail Item
            BookingDetailsItem(
              title: 'Traveler',
              valueText: transaction.amountTraveler == null
                  ? ' person'
                  : '${transaction.amountTraveler} person',
              valueColor: blackColor,
            ),
            BookingDetailsItem(
              title: 'Seat',
              valueText: transaction.selectedSeat,
              valueColor: blackColor,
            ),
            BookingDetailsItem(
              title: 'Insurance',
              valueText: transaction.insurance ? 'YES' : 'NO',
              valueColor: transaction.insurance ? greenColor : redColor,
            ),
            BookingDetailsItem(
              title: 'Refundable',
              valueText: transaction.refundable ? 'YES' : 'NO',
              valueColor: transaction.refundable ? greenColor : redColor,
            ),
            BookingDetailsItem(
              title: 'VAT',
              valueText: '${(transaction.vat * 100).toStringAsFixed(0)} %',
              valueColor: blackColor,
            ),
            BookingDetailsItem(
              title: 'Price',
              valueText: NumberFormat.currency(
                locale: 'id',
                symbol: 'Rp. ',
                decimalDigits: 0,
              ).format(transaction.price),
              valueColor: blackColor,
            ),
            BookingDetailsItem(
              title: 'Grand Total',
              valueText: NumberFormat.currency(
                locale: 'id',
                symbol: 'Rp. ',
                decimalDigits: 0,
              ).format(transaction.grandTotal),
              valueColor: primaryColor,
            ),
          ],
        ),
      );
    }

    Widget paymentDetail() {
      return BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          if (state is AuthSucces) {
            return Container(
              margin: const EdgeInsets.only(top: 30),
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                color: whiteColor,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Payment Details',
                    style: blackTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: semiBold,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 16),
                    child: Row(
                      children: [
                        Container(
                          width: 100,
                          height: 70,
                          margin: const EdgeInsets.only(right: 18),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18),
                            image: const DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage('assets/image_card.png'),
                            ),
                          ),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 24,
                                  width: 24,
                                  margin: const EdgeInsets.only(right: 8),
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                      image:
                                          AssetImage('assets/icon_plane.png'),
                                    ),
                                  ),
                                ),
                                Text(
                                  'Pay',
                                  style: whiteTextStyle.copyWith(
                                    fontSize: 18,
                                    fontWeight: medium,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                NumberFormat.currency(
                                  locale: 'id',
                                  symbol: 'Rp. ',
                                  decimalDigits: 0,
                                ).format(
                                  state.user.balance,
                                ),
                                style: blackTextStyle.copyWith(
                                  fontSize: 20,
                                  fontWeight: medium,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                'Current Balance',
                                style: greyTextStyle.copyWith(
                                  fontSize: 16,
                                  fontWeight: light,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
          return const SizedBox();
        },
      );
    }

    Widget paymentButton() {
      return BlocConsumer<TransactionCubit, TransactionState>(
        listener: (context, state) {
          // TODO: implement listener
          if (state is TransactionSucces) {
            Navigator.pushNamedAndRemoveUntil(
                context, '/succes', (route) => false);
          } else if (state is TransactionFailed) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: redColor,
                content: Text(state.error),
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is TransactionLoading) {
            return Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(top: 30),
              child: const CircularProgressIndicator(),
            );
          }
          return CustomButton(
            width: MediaQuery.of(context).size.width,
            onPressed: () {
              context.read<TransactionCubit>().creatTransaction(transaction);
            },
            title: 'Pay Now',
            margin: const EdgeInsets.only(top: 30),
          );
        },
      );
    }

    Widget taccButton() {
      return Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.only(top: 30, bottom: 40),
        child: TextButton(
          onPressed: () {},
          child: Text(
            'Terms and Conditions',
            style: greyTextStyle.copyWith(
              fontSize: 16,
              fontWeight: light,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: backGroundColor,
      body: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: defaultMargin,
        ),
        children: [
          route(),
          bookingDetail(),
          paymentDetail(),
          paymentButton(),
          taccButton(),
        ],
      ),
    );
  }
}
