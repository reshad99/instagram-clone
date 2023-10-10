import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/data/auth/bloc/auth/auth_bloc.dart';
import 'package:instagram_clone/data/auth/repository/repository.dart';
import 'package:instagram_clone/data/auth/request/register_request.dart';
import 'package:instagram_clone/data/auth/response/register_response.dart';
import 'package:instagram_clone/data/auth/service/service.dart';
import 'package:instagram_clone/services/response/error_response.dart';
import 'package:meta/meta.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final userService = UserService(userRepository: UserRepository());
  final AuthBloc authBloc;
  RegisterBloc(this.authBloc) : super(RegisterInitial()) {
    on<SignUpButtonPressed>((event, emit) async {
      try {
        debugPrint('event triggered');

        emit(RegisterLoading());
        final result = await userService.tryRegister(event.registerRequest);
        debugPrint('result instance $result');
        if (result is RegisterResponse) {
          debugPrint('result is RegisterResponse');
          emit(RegisterInitial());
          authBloc.add(LoggedIn(result.user!, token: result.accessToken!));
        } else if (result is ErrorResponse) {
          debugPrint('result is ErrorResponse');
          emit(RegisterError(errorResponse: result));
        }
      } catch (e) {
        emit(
            RegisterError(errorResponse: ErrorResponse(message: e.toString())));
      }
    });
  }
}
