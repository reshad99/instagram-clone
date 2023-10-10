part of 'register_bloc.dart';

@immutable
sealed class RegisterEvent {}

final class SignUpButtonPressed extends RegisterEvent {
  final RegisterRequest registerRequest;

  SignUpButtonPressed({required this.registerRequest});
}
