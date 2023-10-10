import 'package:instagram_clone/data/auth/repository/repository.dart';
import 'package:instagram_clone/data/auth/request/login_request.dart';
import 'package:instagram_clone/data/auth/request/register_request.dart';
import 'package:instagram_clone/services/response/api_response.dart';

class UserService {
  final UserRepository userRepository;

  UserService({required this.userRepository});

  Future<ApiResponse> tryLogin(LoginRequest loginRequest) {
    return userRepository.tryLogin(loginRequest);
  }

  Future<ApiResponse> tryRegister(RegisterRequest registerRequest) {
    return userRepository.tryRegister(registerRequest);
  }

  bool hasToken() {
    return userRepository.hasToken();
  }

  void saveToken(String token) {
    userRepository.saveToken(token);
  }

  void deleteUserInfo() {
    userRepository.deleteToken();
    userRepository.deleteUser();
  }
}
