import 'package:airplane/models/transaction_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TransactionService {
  // masuk ke firebase firestore
  final CollectionReference _transactionRef =
      FirebaseFirestore.instance.collection('transactions');

  Future<void> createTransaction(TransactionModel transaction) async {
    try {
      _transactionRef.add({
        'destination': transaction.destination.toJson(),
        'amaountTraveler': transaction.amountTraveler,
        'selectedSeat': transaction.selectedSeat,
        'insurance': transaction.insurance,
        'refundable': transaction.refundable,
        'vat': transaction.vat,
        'price': transaction.price,
        'grandTotal': transaction.grandTotal,
      });
    } catch (e) {
      rethrow;
    }
  }

  // Buat method pertama
  Future<List<TransactionModel>> fetchTransaction() async {
    try {
      QuerySnapshot snapshot = await _transactionRef.get();

      List<TransactionModel> transaction = snapshot.docs.map((e) {
        return TransactionModel.fromJson(
            e.id, e.data() as Map<String, dynamic>);
      }).toList();

      return transaction;
    } catch (e) {
      rethrow;
    }
  }
}
