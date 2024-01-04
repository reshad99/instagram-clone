// To parse this JSON data, do
//
//     final showPostsResponse = showPostsResponseFromJson(jsonString);

import 'dart:convert';

import 'package:instagram_clone/data/home/model/post.dart';
import 'package:instagram_clone/services/response/api_response.dart';

ShowPostsResponse showPostsResponseFromJson(String str) =>
    ShowPostsResponse.fromJson(json.decode(str));

String showPostsResponseToJson(ShowPostsResponse data) =>
    json.encode(data.toJson());

class ShowPostsResponse extends ApiResponse {
  bool? success;
  String? message;
  List<Post>? data;

  ShowPostsResponse({
    this.success,
    this.message,
    this.data,
  });

  ShowPostsResponse copyWith({
    bool? success,
    String? message,
    List<Post>? data,
  }) =>
      ShowPostsResponse(
        success: success ?? this.success,
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory ShowPostsResponse.fromJson(Map<String, dynamic> json) =>
      ShowPostsResponse(
        success: json["success"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<Post>.from(json["data"]!.map((x) => Post.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data == null
            ? []
            : List<Post>.from(data!.map((x) => x.toJson())),
      };
}
