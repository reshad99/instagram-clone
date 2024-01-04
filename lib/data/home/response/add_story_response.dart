// To parse this JSON data, do
//
//     final addStoryResponse = addStoryResponseFromJson(jsonString);

import 'dart:convert';

import 'package:instagram_clone/data/home/model/story.dart';
import 'package:instagram_clone/services/response/api_response.dart';

AddStoryResponse addStoryResponseFromJson(String str) =>
    AddStoryResponse.fromJson(json.decode(str));

String addStoryResponseToJson(AddStoryResponse data) =>
    json.encode(data.toJson());

class AddStoryResponse extends ApiResponse {
  bool? success;
  String? message;
  Story data;

  AddStoryResponse({
    this.success,
    this.message,
    required this.data,
  });

  AddStoryResponse copyWith({
    bool? success,
    String? message,
    Story? data,
  }) =>
      AddStoryResponse(
        success: success ?? this.success,
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory AddStoryResponse.fromJson(Map<String, dynamic> json) =>
      AddStoryResponse(
        success: json["success"],
        message: json["message"],
        data: Story.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data.toJson(),
      };
}
