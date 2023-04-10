import 'dart:async';

import 'package:airplane/cubit/auth_cubit.dart';
import 'package:airplane/ui/pages/get_started_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../shared/theme.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    // TODO: implement initState
    Timer(
      const Duration(seconds: 3),
      () {
        // Apakah firebase auth memiliki user yang aktif
        User? user = FirebaseAuth.instance.currentUser;

        if (user == null) {
          Navigator.pushNamedAndRemoveUntil(
              context, '/get-started', (route) => false);
        } else {
          print(user.email);
          // Saat si user bukan null tambahkan
          context.read<AuthCubit>().getCurrentUser(user.uid);
          Navigator.pushNamedAndRemoveUntil(
              context, '/main-page', (route) => false);
        }
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 100,
              height: 100,
              margin: const EdgeInsets.only(bottom: 50),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/icon_plane.png'),
                ),
              ),
            ),
            Text(
              'AIRPLANE',
              style: whiteTextStyle.copyWith(
                fontSize: 32,
                fontWeight: medium,
                letterSpacing: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
