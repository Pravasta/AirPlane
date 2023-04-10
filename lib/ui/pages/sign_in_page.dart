import 'package:airplane/cubit/auth_cubit.dart';
import 'package:airplane/ui/widget/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../shared/theme.dart';
import '../widget/custom_button.dart';

class SignInPage extends StatelessWidget {
  SignInPage({super.key});

  final TextEditingController emailC = TextEditingController(text: '');
  final TextEditingController passC = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    Widget title() {
      return Container(
        margin: const EdgeInsets.only(top: 30),
        child: Text(
          'Sign In with your existing account',
          style: blackTextStyle.copyWith(
            fontSize: 26,
            fontWeight: semiBold,
          ),
        ),
      );
    }

    Widget inputSection() {
      Widget taccButton() {
        return Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.only(top: 50, bottom: 73),
          child: TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/sign-up');
            },
            child: Text(
              'Don\'t have an account? Sign Up',
              style: greyTextStyle.copyWith(
                fontSize: 16,
                fontWeight: light,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        );
      }

      return Container(
        margin: const EdgeInsets.only(top: 30),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(defaultRadius),
        ),
        child: Column(
          children: [
            emailField(),
            passField(),
            submitButton(context),
            taccButton(),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: backGroundColor,
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          children: [
            title(),
            inputSection(),
          ],
        ),
      ),
    );
  }

  Widget submitButton(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        // TODO: implement listener
        // Melakukan listen apabila auth state fail atau succes
        if (state is AuthSucces) {
          Navigator.pushNamedAndRemoveUntil(
              context, '/main-page', (route) => false);
        } else if (state is AuthFailed) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: redColor,
              content: Text(state.error),
            ),
          );
        }
      },
      builder: (context, state) {
        // Jika state sedang Auth Loading
        if (state is AuthLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return CustomButton(
          margin: const EdgeInsets.only(top: 10),
          width: MediaQuery.of(context).size.width,
          title: 'Sign In',
          onPressed: () => context.read<AuthCubit>().singIn(
                email: emailC.text,
                password: passC.text,
              ),
        );
      },
    );
  }

  Widget passField() {
    return CustomTextField(
        controller: passC,
        title: 'Password',
        hintText: 'Your password',
        obsPass: true);
  }

  Widget emailField() {
    return CustomTextField(
        controller: emailC,
        title: 'Email Address',
        hintText: 'Your email address',
        obsPass: false);
  }
}
