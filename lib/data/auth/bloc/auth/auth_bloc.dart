import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/data/auth/model/model.dart';
import 'package:instagram_clone/data/auth/repository/repository.dart';
import 'package:instagram_clone/data/auth/service/service.dart';
import 'package:instagram_clone/services/response/error_response.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserService userService = UserService(userRepository: UserRepository());
  AuthBloc() : super(AuthInitial()) {
    on<AppStarted>((event, emit) {
      try {
        bool hasToken = userService.hasToken();
        if (hasToken) {
          emit(AuthAuthenticated());
        } else {
          emit(AuthUnauthenticated());
        }
      } catch (e) {
        emit(AuthError(errorResponse: ErrorResponse(message: e.toString())));
      }
    });

    on<LoggedIn>((event, emit) {
      try {
        debugPrint('LoggedIn triggered');
        emit(AuthLoading());
        userService.saveToken(event.token);
        emit(AuthAuthenticated());
      } catch (e) {
        emit(AuthError(errorResponse: ErrorResponse(message: e.toString())));
      }
    });

    on<LoggedOut>((event, emit) {
      try {
        emit(AuthLoading());
        userService.deleteUserInfo();
        emit(AuthUnauthenticated());
      } catch (e) {
        emit(AuthError(errorResponse: ErrorResponse(message: e.toString())));
      }
    });
  }
}
