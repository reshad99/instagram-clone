part of 'login_bloc.dart';

abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginError extends LoginState {
  final ErrorResponse errorResponse;

  LoginError({required this.errorResponse});

  @override
  String toString() {
    return "Error: ${errorResponse.message}";
  }
}
