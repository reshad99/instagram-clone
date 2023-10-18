// To parse this JSON data, do
//
//     final addPostResponse = addPostResponseFromJson(jsonString);

import 'dart:convert';

import 'package:instagram_clone/data/home/model/post.dart';
import 'package:instagram_clone/services/response/api_response.dart';

AddPostResponse addPostResponseFromJson(String str) => AddPostResponse.fromJson(json.decode(str));

String addPostResponseToJson(AddPostResponse data) => json.encode(data.toJson());

class AddPostResponse extends ApiResponse {
    bool? success;
    String? message;
    Post? data;

    AddPostResponse({
        this.success,
        this.message,
        this.data,
    });

    AddPostResponse copyWith({
        bool? success,
        String? message,
        Post? data,
    }) => 
        AddPostResponse(
            success: success ?? this.success,
            message: message ?? this.message,
            data: data ?? this.data,
        );

    factory AddPostResponse.fromJson(Map<String, dynamic> json) => AddPostResponse(
        success: json["success"],
        message: json["message"],
        data: json["data"] == null ? null : Post.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data?.toJson(),
    };
}
