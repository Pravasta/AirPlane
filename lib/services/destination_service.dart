import 'package:airplane/models/destination_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DestinationService {
  final CollectionReference _destinationRef =
      FirebaseFirestore.instance.collection('destinations');

  // Buat method pertama
  Future<List<DestinationModel>> fetchDestinations() async {
    try {
      QuerySnapshot snapshot = await _destinationRef.get();

      List<DestinationModel> destinations = snapshot.docs.map((e) {
        return DestinationModel.fromJson(
            e.id, e.data() as Map<String, dynamic>);
      }).toList();

      return destinations;
    } catch (e) {
      rethrow;
    }
  }
}
