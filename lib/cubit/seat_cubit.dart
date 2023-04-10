import 'package:flutter_bloc/flutter_bloc.dart';

class SeatCubit extends Cubit<List<String>> {
  SeatCubit() : super([]);

  void selectSeat(String id) {
    print('prevState :$state');
    // Jika belum dipilih akan menambahkan id tsb
    if (!isSelected(id)) {
      state.add(id);
    } else {
      // Jika sudah dipili dan di klik lagi maka akan hilang
      state.remove(id);
    }
    print('newState :$state');
    // emit(state);
    // Ini membuat instance yang baru
    emit(List.from(state));
  }

  // Untuk menghandle double id di dalam array
  bool isSelected(String id) {
    int index = state.indexOf(id);

    // Jika index nya == -1 itu berarti belum ada di List
    if (index == -1) {
      return false;
    } else {
      // Jika != -1 maka sudah ada di list dan return true
      return true;
    }
  }
}
