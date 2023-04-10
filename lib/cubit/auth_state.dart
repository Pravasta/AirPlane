part of 'auth_cubit.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

// AuthInitial untuk inisialisasi dari authCubit
class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSucces extends AuthState {
  final UserModel user;

  const AuthSucces(this.user);

  @override
  // TODO: implement props
  List<Object> get props => [user];
}

class AuthFailed extends AuthState {
  final String error;

  const AuthFailed(this.error);

  @override
  // TODO: implement props
  List<Object> get props => [error];
}
