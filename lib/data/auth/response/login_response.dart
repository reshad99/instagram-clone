// To parse this JSON data, do
//
//     final loginResponse = loginResponseFromJson(jsonString);

import 'dart:convert';

import 'package:instagram_clone/data/auth/model/model.dart';
import 'package:instagram_clone/services/response/api_response.dart';

LoginResponse loginResponseFromJson(String str) =>
    LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse extends ApiResponse {
  bool? success;
  UserModel? user;
  String? accessToken;
  String? tokenType;

  LoginResponse({
    this.success,
    this.user,
    this.accessToken,
    this.tokenType,
  });

  LoginResponse copyWith({
    bool? success,
    UserModel? user,
    String? accessToken,
    String? tokenType,
  }) =>
      LoginResponse(
        success: success ?? this.success,
        user: user ?? this.user,
        accessToken: accessToken ?? this.accessToken,
        tokenType: tokenType ?? this.tokenType,
      );

factory LoginResponse.fromJson(Map<String, dynamic> json) {
  final userModel = UserModel.fromJson(json["user"]);

  return LoginResponse(
    success: json["success"],
    user: userModel, // Assign the UserModel directly
    accessToken: json["access_token"],
    tokenType: json["token_type"],
  );
}

  Map<String, dynamic> toJson() => {
        "success": success,
        "user": user?.toJson(),
        "access_token": accessToken,
        "token_type": tokenType,
      };
}

