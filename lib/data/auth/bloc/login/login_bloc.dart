import 'package:bloc/bloc.dart';
import 'package:instagram_clone/data/auth/bloc/auth/auth_bloc.dart';
import 'package:instagram_clone/data/auth/repository/repository.dart';
import 'package:instagram_clone/data/auth/request/login_request.dart';
import 'package:instagram_clone/data/auth/response/login_response.dart';
import 'package:instagram_clone/data/auth/service/service.dart';
import 'package:instagram_clone/services/response/error_response.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final userService = UserService(userRepository: UserRepository());
  final AuthBloc authBloc;
  LoginBloc(this.authBloc) : super(LoginInitial()) {
    on<LoginButtonPressed>((event, emit) async {
      try {
        emit(LoginLoading());
        final result = await userService.tryLogin(event.loginRequest);
        if (result is LoginResponse) {
          authBloc.add(LoggedIn(result.user!, token: result.accessToken!));
          emit(LoginInitial());
        } else if (result is ErrorResponse) {
          emit(LoginError(errorResponse: result));
        }
      } catch (e) {
        emit(LoginError(errorResponse: ErrorResponse(message: e.toString())));
      }
    });
  }
}
