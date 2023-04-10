import 'package:airplane/models/transaction_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../shared/theme.dart';
import 'booking_detail_items.dart';

class TransactionCard extends StatelessWidget {
  final TransactionModel transaction;

  const TransactionCard(this.transaction, {super.key});

  @override
  Widget build(BuildContext context) {
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
}
