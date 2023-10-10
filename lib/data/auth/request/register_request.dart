// To parse this JSON data, do
//
//     final registerRequest = registerRequestFromJson(jsonString);

import 'dart:convert';

RegisterRequest registerRequestFromJson(String str) =>
    RegisterRequest.fromJson(json.decode(str));

String registerRequestToJson(RegisterRequest data) =>
    json.encode(data.toJson());

class RegisterRequest {
  String? email;
  String? phone;
  String? username;
  String? password;
  String? passwordConfirmation;

  RegisterRequest({
    this.email,
    this.phone,
    this.username,
    this.password,
    this.passwordConfirmation,
  });

  RegisterRequest copyWith({
    String? email,
    String? phone,
    String? username,
    String? password,
    String? passwordConfirmation,
  }) =>
      RegisterRequest(
        email: email ?? this.email,
        phone: phone ?? this.phone,
        username: username ?? this.username,
        password: password ?? this.password,
        passwordConfirmation: passwordConfirmation ?? this.passwordConfirmation,
      );

  factory RegisterRequest.fromJson(Map<String, dynamic> json) =>
      RegisterRequest(
        email: json["email"],
        phone: json["phone"],
        username: json["username"],
        password: json["password"],
        passwordConfirmation: json["password_confirmation"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "phone": phone,
        "username": username,
        "password": password,
        "password_confirmation": passwordConfirmation,
      };
}
