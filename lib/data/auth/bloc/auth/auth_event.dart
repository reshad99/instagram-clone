part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class AppStarted extends AuthEvent {}

class LoggedIn extends AuthEvent {
  final String token;
  final UserModel userModel;

  LoggedIn(
    this.userModel, {
    required this.token,
  });
  List<Object> get props => [token, userModel];

  @override
  String toString() {
    return "LoggedIn $token";
  }
}

class LoggedOut extends AuthEvent {}
