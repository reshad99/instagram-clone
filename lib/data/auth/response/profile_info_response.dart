// To parse this JSON data, do
//
//     final profileInfoResponse = profileInfoResponseFromJson(jsonString);

import 'dart:convert';

import 'package:instagram_clone/data/auth/model/model.dart';
import 'package:instagram_clone/services/response/api_response.dart';

ProfileInfoResponse profileInfoResponseFromJson(String str) =>
    ProfileInfoResponse.fromJson(json.decode(str));

String profileInfoResponseToJson(ProfileInfoResponse data) =>
    json.encode(data.toJson());

class ProfileInfoResponse extends ApiResponse{
  bool? success;
  String? message;
  UserModel? data;

  ProfileInfoResponse({
    this.success,
    this.message,
    this.data,
  });

  ProfileInfoResponse copyWith({
    bool? success,
    String? message,
    UserModel? data,
  }) =>
      ProfileInfoResponse(
        success: success ?? this.success,
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory ProfileInfoResponse.fromJson(Map<String, dynamic> json) =>
      ProfileInfoResponse(
        success: json["success"],
        message: json["message"],
        data: json["data"] == null ? null : UserModel.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data?.toJson(),
      };
}
