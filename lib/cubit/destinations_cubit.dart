import 'package:airplane/models/destination_model.dart';
import 'package:airplane/services/destination_service.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'destinations_state.dart';

class DestinationsCubit extends Cubit<DestinationsState> {
  DestinationsCubit() : super(DestinationsInitial());

  void fetchDestinations() async {
    try {
      emit(DestinationsLoading());
      // Ambil data dulu
      List<DestinationModel> destinations =
          await DestinationService().fetchDestinations();
      // Kalau berhasil akan melakukan
      emit(DestinationsSuccess(destinations));
    } catch (e) {
      emit(
        DestinationsFailed(
          e.toString(),
        ),
      );
    }
  }
}
