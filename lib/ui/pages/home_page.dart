import 'package:airplane/cubit/auth_cubit.dart';
import 'package:airplane/cubit/destinations_cubit.dart';
import 'package:airplane/models/destination_model.dart';
import 'package:airplane/shared/theme.dart';
import 'package:airplane/ui/widget/destination_card.dart';
import 'package:airplane/ui/widget/destination_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //
  // akan dipanggil ketika halaman ini pertama kali dibuka
  @override
  void initState() {
    // TODO: implement initState
    // Melaukan fetching data
    context.read<DestinationsCubit>().fetchDestinations();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          if (state is AuthSucces) {
            return Container(
              margin: EdgeInsets.only(
                left: defaultMargin,
                right: defaultMargin,
                top: 30,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Howdy,\n${state.user.name}',
                          style: blackTextStyle.copyWith(
                            fontSize: 24,
                            fontWeight: semiBold,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 6),
                        Text(
                          'Where to fly today?',
                          style: greyTextStyle.copyWith(
                              fontWeight: light, fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 60,
                    height: 60,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage(
                          'assets/image_profile.png',
                        ),
                      ),
                    ),
                  )
                ],
              ),
            );
          } else {
            return const SizedBox();
          }
        },
      );
    }

    Widget popularDestination(List<DestinationModel> destinations) {
      return Container(
        margin: const EdgeInsets.only(top: 30),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: destinations
                .map(
                  (DestinationModel destinationModel) =>
                      DestinationCard(destinationModel: destinationModel),
                )
                .toList(),
          ),
        ),
      );
    }

    Widget newDestination(List<DestinationModel> destinations) {
      return Container(
        margin: EdgeInsets.only(
          top: 30,
          right: defaultMargin,
          left: defaultMargin,
          bottom: 140,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'New This Year',
              style: blackTextStyle.copyWith(
                fontWeight: semiBold,
                fontSize: 18,
              ),
            ),
            Column(
              children: destinations
                  .map((DestinationModel destinations) =>
                      DestinationTile(destinationModel: destinations))
                  .toList(),
            )
          ],
        ),
      );
    }

    return BlocConsumer<DestinationsCubit, DestinationsState>(
      listener: (context, state) {
        // TODO: implement listener
        if (state is DestinationsFailed) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: redColor,
              content: Text(state.error),
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is DestinationsSuccess) {
          return ListView(
            children: [
              header(),
              popularDestination(state.destinations),
              newDestination(state.destinations),
            ],
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
