// To parse this JSON data, do
//
//     final loginRequest = loginRequestFromJson(jsonString);

import 'dart:convert';

LoginRequest loginRequestFromJson(String str) => LoginRequest.fromJson(json.decode(str));

String loginRequestToJson(LoginRequest data) => json.encode(data.toJson());

class LoginRequest {
    String? login;
    String? password;

    LoginRequest({
        this.login,
        this.password,
    });

    LoginRequest copyWith({
        String? login,
        String? password,
    }) => 
        LoginRequest(
            login: login ?? this.login,
            password: password ?? this.password,
        );

    factory LoginRequest.fromJson(Map<String, dynamic> json) => LoginRequest(
        login: json["login"],
        password: json["password"],
    );

    Map<String, dynamic> toJson() => {
        "login": login,
        "password": password,
    };
}
