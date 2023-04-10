import 'package:airplane/cubit/transaction_cubit.dart';
import 'package:airplane/shared/theme.dart';
import 'package:airplane/ui/widget/transaction_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TransactionPage extends StatefulWidget {
  const TransactionPage({super.key});

  @override
  State<TransactionPage> createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  @override
  void initState() {
    // TODO: implement initState
    context.read<TransactionCubit>().fetchTransaction();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransactionCubit, TransactionState>(
      builder: (context, state) {
        print(state);
        if (state is TransactionLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is TransactionSucces) {
          if (state.transaction.isEmpty) {
            return const Center(
              child: Text('Tidak ada transaksi Aktif'),
            );
          } else {
            return Container(
              margin: EdgeInsets.only(
                top: defaultMargin,
                right: defaultMargin,
                left: defaultMargin,
                bottom: defaultMargin,
              ),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                color: whiteColor,
              ),
              child: ListView.builder(
                padding: EdgeInsets.only(
                  right: defaultMargin,
                  left: defaultMargin,
                  bottom: 70,
                ),
                itemCount: state.transaction.length,
                itemBuilder: (context, index) {
                  return TransactionCard(state.transaction[index]);
                },
              ),
            );
          }
        }
        return const Center(
          child: Text('Transaction Page'),
        );
      },
    );
  }
}
