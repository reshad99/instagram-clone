import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/data/auth/model/model.dart';
import 'package:instagram_clone/data/auth/repository/repository.dart';
import 'package:instagram_clone/data/auth/response/profile_info_response.dart';
import 'package:instagram_clone/data/auth/service/service.dart';
import 'package:instagram_clone/services/response/error_response.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserService userService = UserService(userRepository: UserRepository());
  AuthBloc() : super(AuthInitial()) {
    on<AppStarted>((event, emit) async {
      try {
        bool hasToken = userService.hasToken();
        if (hasToken) {
          final result = await userService.profileInfo();

          if (result is ProfileInfoResponse) {
            userService.updateUser(result.data!);
            emit(AuthAuthenticated());
          } else {
            emit(AuthUnauthenticated());
          }
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
        userService.saveToken(event.token);
        userService.saveUser(event.userModel);
        emit(AuthAuthenticated());
      } catch (e) {
        emit(AuthError(errorResponse: ErrorResponse(message: e.toString())));
      }
    });

    on<LoggedOut>((event, emit) {
      try {
        userService.deleteUserInfo();
        emit(AuthUnauthenticated());
      } catch (e) {
        emit(AuthError(errorResponse: ErrorResponse(message: e.toString())));
      }
    });
  }
}
