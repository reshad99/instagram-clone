// To parse this JSON data, do
//
//     final registerResponse = registerResponseFromJson(jsonString);

import 'dart:convert';

import 'package:instagram_clone/data/auth/model/model.dart';
import 'package:instagram_clone/services/response/api_response.dart';

RegisterResponse registerResponseFromJson(String str) => RegisterResponse.fromJson(json.decode(str));

String registerResponseToJson(RegisterResponse data) => json.encode(data.toJson());

class RegisterResponse extends ApiResponse{
    bool? success;
    UserModel? user;
    String? accessToken;
    String? tokenType;

    RegisterResponse({
        this.success,
        this.user,
        this.accessToken,
        this.tokenType,
    });

    RegisterResponse copyWith({
        bool? success,
        UserModel? user,
        String? accessToken,
        String? tokenType,
    }) => 
        RegisterResponse(
            success: success ?? this.success,
            user: user ?? this.user,
            accessToken: accessToken ?? this.accessToken,
            tokenType: tokenType ?? this.tokenType,
        );

    factory RegisterResponse.fromJson(Map<String, dynamic> json) => RegisterResponse(
        success: json["success"],
        user: json["user"] == null ? null : UserModel.fromJson(json["user"]),
        accessToken: json["access_token"],
        tokenType: json["token_type"],
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "user": user?.toJson(),
        "access_token": accessToken,
        "token_type": tokenType,
    };
}

