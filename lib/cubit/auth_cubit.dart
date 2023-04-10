import 'package:airplane/models/user.dart';
import 'package:airplane/services/auth_services.dart';
import 'package:airplane/services/user_service.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  // method untuk signUp
  void signUp(
      {required String email,
      required String password,
      required String name,
      String hobby = ''}) async {
    try {
      // Mengganti state menjadi loading
      emit(AuthLoading());

      // Setelah loading membuat sebuah objek
      UserModel user = await AuthService().signUp(
        email: email,
        password: password,
        name: name,
        hobby: hobby,
      );

      // Jika berhasil akan melakukan auth sucsess user nya
      emit(AuthSucces(user));
    } catch (e) {
      emit(AuthFailed(e.toString()));
    }
  }

  void signOut() async {
    try {
      emit(AuthLoading());
      await AuthService().signOut();
      // Jadi setelah di sigOut Auth nya akan kembali ke AuthInitial lagi / memasukkan data lagi mendaftar
      emit(AuthInitial());
    } catch (e) {
      emit(AuthFailed(e.toString()));
    }
  }

  void getCurrentUser(String id) async {
    try {
      // membuat objek
      UserModel user = await UserService().getUserById(id);
      // Kalau berhasil
      emit(AuthSucces(user));
    } catch (e) {
      emit(
        AuthFailed(
          e.toString(),
        ),
      );
    }
  }

  void singIn({required String email, required String password}) async {
    try {
      emit(AuthLoading());
      UserModel user =
          await AuthService().signin(email: email, password: password);
      emit(AuthSucces(user));
    } catch (e) {
      emit(
        AuthFailed(
          e.toString(),
        ),
      );
    }
  }
}
