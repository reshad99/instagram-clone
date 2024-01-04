// To parse this JSON data, do
//
//     final showFollowsResponse = showFollowsResponseFromJson(jsonString);

import 'dart:convert';

import 'package:instagram_clone/data/auth/model/model.dart';
import 'package:instagram_clone/services/response/api_response.dart';

ShowFollowsResponse showFollowsResponseFromJson(String str) => ShowFollowsResponse.fromJson(json.decode(str));

String showFollowsResponseToJson(ShowFollowsResponse data) => json.encode(data.toJson());

class ShowFollowsResponse extends ApiResponse {
    bool? success;
    String? message;
    List<UserModel>? data;

    ShowFollowsResponse({
        this.success,
        this.message,
        this.data,
    });

    ShowFollowsResponse copyWith({
        bool? success,
        String? message,
        List<UserModel>? data,
    }) => 
        ShowFollowsResponse(
            success: success ?? this.success,
            message: message ?? this.message,
            data: data ?? this.data,
        );

    factory ShowFollowsResponse.fromJson(Map<String, dynamic> json) => ShowFollowsResponse(
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
