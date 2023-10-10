part of 'login_bloc.dart';

abstract class LoginEvent {}

class LoginButtonPressed extends LoginEvent {
  final LoginRequest loginRequest;

  LoginButtonPressed({required this.loginRequest});

  @override
  String toString() {
    return "LoginButtonPressed login: ${loginRequest.login}, password: ${loginRequest.password}";
  }
}
