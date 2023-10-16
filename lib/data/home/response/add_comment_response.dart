// To parse this JSON data, do
//
//     final addCommentResponse = addCommentResponseFromJson(jsonString);

import 'dart:convert';

import 'package:instagram_clone/data/home/model/comment.dart';
import 'package:instagram_clone/services/response/api_response.dart';

AddCommentResponse addCommentResponseFromJson(String str) => AddCommentResponse.fromJson(json.decode(str));

String addCommentResponseToJson(AddCommentResponse data) => json.encode(data.toJson());

class AddCommentResponse extends ApiResponse {
    bool? success;
    String? message;
    Comment? data;

    AddCommentResponse({
        this.success,
        this.message,
        this.data,
    });

    AddCommentResponse copyWith({
        bool? success,
        String? message,
        Comment? data,
    }) => 
        AddCommentResponse(
            success: success ?? this.success,
            message: message ?? this.message,
            data: data ?? this.data,
        );

    factory AddCommentResponse.fromJson(Map<String, dynamic> json) => AddCommentResponse(
        success: json["success"],
        message: json["message"],
        data: json["data"] == null ? null : Comment.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data?.toJson(),
    };
}
