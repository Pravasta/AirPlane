import 'package:airplane/models/user.dart';
import 'package:airplane/services/user_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<UserModel> signUp(
      {required String email,
      required String password,
      required String name,
      String hobby = ''}) async {
    // Jagani kalau error
    try {
      // register ke firebase auth
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      UserModel user = UserModel(
        id: userCredential.user!.uid,
        email: email,
        name: name,
        hobby: hobby,
        balance: 280000000,
      );
      // register ke firestore
      await UserService().setUser(user);

      return user;
    } catch (e) {
      rethrow;
    }
  }

  // SignIn
  Future<UserModel> signin(
      {required String email, required String password}) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      // Mengambil data dari firebase yang sudah ada akun nya
      UserModel user =
          await UserService().getUserById(userCredential.user!.uid);

      return user;
    } catch (e) {
      rethrow;
    }
  }

  // SIgnOut
  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      rethrow;
    }
  }
}
