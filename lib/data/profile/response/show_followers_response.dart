// To parse this JSON data, do
//
//     final showFollowersResponse = showFollowersResponseFromJson(jsonString);

import 'dart:convert';

import 'package:instagram_clone/data/auth/model/model.dart';
import 'package:instagram_clone/services/response/api_response.dart';

ShowFollowersResponse showFollowersResponseFromJson(String str) => ShowFollowersResponse.fromJson(json.decode(str));

String showFollowersResponseToJson(ShowFollowersResponse data) => json.encode(data.toJson());

class ShowFollowersResponse extends ApiResponse {
    bool? success;
    String? message;
    List<UserModel>? data;

    ShowFollowersResponse({
        this.success,
        this.message,
        this.data,
    });

    ShowFollowersResponse copyWith({
        bool? success,
        String? message,
        List<UserModel>? data,
    }) => 
        ShowFollowersResponse(
            success: success ?? this.success,
            message: message ?? this.message,
            data: data ?? this.data,
        );

    factory ShowFollowersResponse.fromJson(Map<String, dynamic> json) => ShowFollowersResponse(
        success: json["success"],
        message: json["message"],
        data: json["data"] == null ? [] : List<UserModel>.from(json["data"]!.map((x) => UserModel.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data == null ? [] : List<UserModel>.from(data!.map((x) => x.toJson())),
    };
}
