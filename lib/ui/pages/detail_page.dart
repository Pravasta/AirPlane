import 'package:airplane/models/destination_model.dart';
import 'package:airplane/shared/theme.dart';
import 'package:airplane/ui/pages/choose_seat_page.dart';
import 'package:airplane/ui/widget/custom_button.dart';
import 'package:airplane/ui/widget/interest_item.dart';
import 'package:airplane/ui/widget/photo_item.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DetailPage extends StatelessWidget {
  final DestinationModel destination;

  const DetailPage({super.key, required this.destination});

  @override
  Widget build(BuildContext context) {
    Widget backgroundImage() {
      return Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height / 2,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(destination.imageUrl),
          ),
        ),
      );
    }

    Widget customShadow() {
      return Container(
        height: MediaQuery.of(context).size.height / 4,
        width: double.infinity,
        margin: const EdgeInsets.only(top: 256),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              whiteColor.withOpacity(0),
              Colors.black.withOpacity(0.95),
            ],
          ),
        ),
      );
    }

    Widget content() {
      return Container(
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.symmetric(horizontal: defaultMargin),
        child: Column(
          children: [
            // NOTE: EMBLEM
            Container(
              width: 108,
              height: 24,
              margin: const EdgeInsets.only(top: 30),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/icon_emblem.png'),
                ),
              ),
            ),
            // NOTE: TITLE
            Container(
              margin: const EdgeInsets.only(
                top: 256,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          destination.name,
                          style: whiteTextStyle.copyWith(
                            fontSize: 26,
                            fontWeight: semiBold,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          destination.city,
                          style: whiteTextStyle.copyWith(
                            fontSize: 18,
                            fontWeight: light,
                          ),
                        ),
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
                        '${destination.rating}',
                        style: whiteTextStyle.copyWith(
                            fontWeight: medium, fontSize: 16),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // NOTE: Description
            Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.only(top: 30),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(18),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Note: About
                  Text(
                    'About',
                    style: blackTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: semiBold,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'Berada di jalur jalan provinsi yang menghubungkan Denpasar Singaraja serta letaknya yang dekat dengan Kebun Raya Eka Karya menjadikan tempat Bali.',
                    style: blackTextStyle.copyWith(
                      fontSize: 16,
                      height: 2,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Photos',
                    style: blackTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: semiBold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: const [
                      PhotosItem(image: 'assets/image_photo1.png'),
                      PhotosItem(image: 'assets/image_photo2.png'),
                      PhotosItem(image: 'assets/image_photo3.png'),
                    ],
                  ),

                  // NOTES: Interest
                  const SizedBox(height: 20),
                  Text(
                    'Interest',
                    style: blackTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: semiBold,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: const [
                      InterestWidget(text: 'Kids Park'),
                      InterestWidget(text: 'Honor Bridge'),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: const [
                      InterestWidget(text: 'City Museum'),
                      InterestWidget(text: 'Central Mall'),
                    ],
                  ),
                ],
              ),
            ),
            //  NOTES: Price and BOOK Button
            Container(
              margin: const EdgeInsets.symmetric(vertical: 30),
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: [
                  // PRICE
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          NumberFormat.currency(
                            locale: 'id',
                            symbol: 'Rp. ',
                            decimalDigits: 0,
                          ).format(destination.price),
                          style: blackTextStyle.copyWith(
                            fontSize: 20,
                            fontWeight: medium,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          'Per Orang',
                          style: greyTextStyle.copyWith(
                            fontWeight: light,
                            fontSize: 16,
                          ),
                        )
                      ],
                    ),
                  ),
                  // Book Button
                  CustomButton(
                    width: 170,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChooseSeatPage(
                            destination,
                          ),
                        ),
                      );
                    },
                    title: 'Book Now',
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: whiteColor,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            backgroundImage(),
            customShadow(),
            content(),
          ],
        ),
      ),
    );
  }
}
