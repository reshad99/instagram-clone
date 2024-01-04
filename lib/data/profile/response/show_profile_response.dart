// To parse this JSON data, do
//
//     final showProfileResponse = showProfileResponseFromJson(jsonString);

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:instagram_clone/data/auth/model/model.dart';
import 'package:instagram_clone/services/response/api_response.dart';

ShowProfileResponse showProfileResponseFromJson(String str) =>
    ShowProfileResponse.fromJson(json.decode(str));

String showProfileResponseToJson(ShowProfileResponse data) =>
    json.encode(data.toJson());

class ShowProfileResponse extends ApiResponse {
  bool? success;
  String? message;
  UserModel? data;

  ShowProfileResponse({
    this.success,
    this.message,
    this.data,
  });

  ShowProfileResponse copyWith({
    bool? success,
    String? message,
    UserModel? data,
  }) =>
      ShowProfileResponse(
        success: success ?? this.success,
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory ShowProfileResponse.fromJson(Map<String, dynamic> json) {
    debugPrint("ShowProfileResponse.fromJson ${json['data']}");
    return ShowProfileResponse(
      success: json["success"],
      message: json["message"],
      data: json["data"] == null ? null : UserModel.fromJson(json["data"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data?.toJson(),
      };
}
