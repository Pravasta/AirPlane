import 'package:airplane/cubit/auth_cubit.dart';
import 'package:airplane/ui/widget/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../shared/theme.dart';
import '../widget/custom_button.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});

  final TextEditingController nameC = TextEditingController(text: '');
  final TextEditingController emailC = TextEditingController(text: '');
  final TextEditingController passC = TextEditingController(text: '');
  final TextEditingController hobbyC = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    Widget title() {
      return Container(
        margin: const EdgeInsets.only(top: 30),
        child: Text(
          'Join us and get\nyour next journey',
          style: blackTextStyle.copyWith(fontSize: 24, fontWeight: semiBold),
        ),
      );
    }

    Widget inputSection() {
      Widget signInButton() {
        return Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.only(top: 50, bottom: 73),
          child: TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/sign-in');
            },
            child: Text(
              'Have an account? Sign In',
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
            nameField(),
            emailField(),
            passField(),
            hobyField(),
            submitButton(context),
            signInButton(),
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
              context, '/bonus', (route) => false);
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
          title: 'GET STARTED',
          onPressed: () => context.read<AuthCubit>().signUp(
                email: emailC.text,
                password: passC.text,
                name: nameC.text,
                hobby: hobbyC.text,
              ),
        );
      },
    );
  }

  Widget hobyField() {
    return CustomTextField(
        controller: hobbyC,
        title: 'Hobby',
        hintText: 'Your hobby',
        obsPass: false);
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

  Widget nameField() {
    return CustomTextField(
        controller: nameC,
        title: 'Full Name',
        hintText: 'Your full name',
        obsPass: false);
  }
}
