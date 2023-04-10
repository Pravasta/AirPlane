import 'package:airplane/models/destination_model.dart';
import 'package:equatable/equatable.dart';

class TransactionModel extends Equatable {
  final String id;
  final DestinationModel destination;
  final int? amountTraveler;
  final String selectedSeat;
  final bool insurance;
  final bool refundable;
  final double vat;
  final int? price;
  final int? grandTotal;

  const TransactionModel({
    this.id = '',
    required this.destination,
    this.amountTraveler,
    this.selectedSeat = '',
    this.insurance = false,
    this.refundable = false,
    this.vat = 0,
    this.price = 0,
    this.grandTotal = 0,
  });

  factory TransactionModel.fromJson(String id, Map<String, dynamic>? json) =>
      TransactionModel(
        id: id,
        destination: DestinationModel.fromJson(
          json?['destination']['id'],
          json?['destination'],
        ),
        amountTraveler: json?['amaountTraveler'],
        selectedSeat: json?['selectedSeat'],
        insurance: json?['insurance'],
        refundable: json?['refundable'],
        vat: json?['vat'],
        price: json?['price'],
        grandTotal: json?['grandTotal'],
      );

  @override
  // TODO: implement props
  List<Object?> get props => [
        destination,
        amountTraveler,
        selectedSeat,
        insurance,
        refundable,
        vat,
        price,
        grandTotal,
      ];
}
