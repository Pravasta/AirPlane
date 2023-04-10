import 'package:airplane/models/transaction_model.dart';
import 'package:airplane/services/transaction_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'transaction_state.dart';

class TransactionCubit extends Cubit<TransactionState> {
  TransactionCubit() : super(TransactionInitial());

  // Method ketika kita mengirimkan untuk transaksi
  void creatTransaction(TransactionModel transaction) async {
    try {
      emit(TransactionLoading());
      await TransactionService().createTransaction(transaction);
      emit(const TransactionSucces([]));
    } catch (e) {
      emit(
        TransactionFailed(
          e.toString(),
        ),
      );
    }
  }

  void fetchTransaction() async {
    try {
      emit(TransactionLoading());
      List<TransactionModel> transactions =
          await TransactionService().fetchTransaction();
      emit(TransactionSucces(transactions));
    } catch (e) {
      print(e);
      emit(
        TransactionFailed(
          e.toString(),
        ),
      );
    }
  }
}
