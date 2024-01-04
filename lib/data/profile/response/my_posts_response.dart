// To parse this JSON data, do
//
//     final myPostsResponse = myPostsResponseFromJson(jsonString);

import 'dart:convert';

import 'package:instagram_clone/data/home/model/post.dart';
import 'package:instagram_clone/services/response/api_response.dart';

MyPostsResponse myPostsResponseFromJson(String str) => MyPostsResponse.fromJson(json.decode(str));

String myPostsResponseToJson(MyPostsResponse data) => json.encode(data.toJson());

class MyPostsResponse extends ApiResponse {
    bool? success;
    String? message;
    List<Post>? data;

    MyPostsResponse({
        this.success,
        this.message,
        this.data,
    });

    MyPostsResponse copyWith({
        bool? success,
        String? message,
        List<Post>? data,
    }) => 
        MyPostsResponse(
            success: success ?? this.success,
            message: message ?? this.message,
            data: data ?? this.data,
        );

    factory MyPostsResponse.fromJson(Map<String, dynamic> json) => MyPostsResponse(
        success: json["success"],
        message: json["message"],
        data: json["data"] == null ? [] : List<Post>.from(json["data"]!.map((x) => Post.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}
