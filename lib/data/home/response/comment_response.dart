// To parse this JSON data, do
//
//     final commentResponse = commentResponseFromJson(jsonString);

import 'dart:convert';

import 'package:instagram_clone/data/home/model/comment.dart';
import 'package:instagram_clone/services/response/api_response.dart';

CommentResponse commentResponseFromJson(String str) =>
    CommentResponse.fromJson(json.decode(str));

String commentResponseToJson(CommentResponse data) =>
    json.encode(data.toJson());

class CommentResponse extends ApiResponse {
  bool? success;
  String? message;
  List<Comment>? data;

  CommentResponse({
    this.success,
    this.message,
    this.data,
  });

  CommentResponse copyWith({
    bool? success,
    String? message,
    List<Comment>? data,
  }) =>
      CommentResponse(
        success: success ?? this.success,
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory CommentResponse.fromJson(Map<String, dynamic> json) =>
      CommentResponse(
        success: json["success"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<Comment>.from(json["data"]!.map((x) => Comment.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}
