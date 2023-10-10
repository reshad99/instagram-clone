import 'package:instagram_clone/data/auth/const.dart';
import 'package:instagram_clone/data/auth/model/model.dart';
import 'package:instagram_clone/data/auth/request/login_request.dart';
import 'package:instagram_clone/data/auth/request/register_request.dart';
import 'package:instagram_clone/data/auth/response/login_response.dart';
import 'package:instagram_clone/data/auth/response/register_response.dart';
import 'package:instagram_clone/services/api/api_service.dart';
import 'package:instagram_clone/services/local_database/local_database.dart';
import 'package:instagram_clone/services/locator.dart';
import 'package:instagram_clone/services/response/api_response.dart';
import 'package:instagram_clone/services/response/error_response.dart';

class UserRepository {
  final localDB = locator<LocalDatabase>();
  final apiService = ApiService();

  bool hasToken() {
    final token = localDB.get('token');

    if (token != null) {
      return true;
    } else {
      return false;
    }
  }

//errorlari daha yaxsi handle etmek ucun bir logic fikirles
  Future<ApiResponse> tryLogin(LoginRequest loginRequest) async {
    final result = await apiService.sendRequest
        .post(loginUrl, data: loginRequest.toJson());

    if (result.data['success'] == true) {
      return LoginResponse.fromJson(result.data);
    } else {
      return ErrorResponse.fromJson(result.data);
    }
  }

  Future<ApiResponse> tryRegister(RegisterRequest registerRequest) async {
    final result = await apiService.sendRequest
        .post(registerUrl, data: registerRequest.toJson());

    if (result.data['success'] == true) {
      return RegisterResponse.fromJson(result.data);
    } else {
      return ErrorResponse.fromJson(result.data);
    }
  }

  saveToken(String token) {
    localDB.store('token', token);
  }

  saveUser(UserModel user) {
    localDB.store('user', user);
  }

  deleteToken() {
    localDB.delete('token');
  }

  deleteUser() {
    localDB.delete('user');
  }
}
