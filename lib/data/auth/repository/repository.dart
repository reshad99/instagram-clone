import 'package:instagram_clone/core/helpers/helpers.dart';
import 'package:instagram_clone/core/mixins/authentication.dart';
import 'package:instagram_clone/data/auth/const.dart';
import 'package:instagram_clone/data/auth/model/model.dart';
import 'package:instagram_clone/data/auth/request/login_request.dart';
import 'package:instagram_clone/data/auth/request/register_request.dart';
import 'package:instagram_clone/data/auth/response/login_response.dart';
import 'package:instagram_clone/data/auth/response/profile_info_response.dart';
import 'package:instagram_clone/data/auth/response/register_response.dart';
import 'package:instagram_clone/services/response/api_response.dart';
import 'package:instagram_clone/services/response/error_response.dart';

class UserRepository with Authentication {
  bool hasToken() {
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

  Future<ApiResponse> profileInfo() async {
    final result = await apiService.sendRequest
        .get(profileInfoUrl, options: addOptions(token!));

    if (result.data['success'] == true) {
      return ProfileInfoResponse.fromJson(result.data);
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

  updateUser(UserModel user) {
    localDB.store('user', user);
  }

  deleteToken() {
    localDB.delete('token');
  }

  deleteUser() {
    localDB.delete('user');
  }
}
