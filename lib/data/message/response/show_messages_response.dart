// To parse this JSON data, do
//
//     final showMessagesResponse = showMessagesResponseFromJson(jsonString);

import 'dart:convert';

import 'package:instagram_clone/data/message/model/message.dart';
import 'package:instagram_clone/services/response/api_response.dart';

ShowMessagesResponse showMessagesResponseFromJson(String str) =>
    ShowMessagesResponse.fromJson(json.decode(str));

String showMessagesResponseToJson(ShowMessagesResponse data) =>
    json.encode(data.toJson());

class ShowMessagesResponse extends ApiResponse {
  bool? success;
  String? message;
  List<Message>? data;

  ShowMessagesResponse({
    this.success,
    this.message,
    this.data,
  });

  ShowMessagesResponse copyWith({
    bool? success,
    String? message,
    List<Message>? data,
  }) =>
      ShowMessagesResponse(
        success: success ?? this.success,
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory ShowMessagesResponse.fromJson(Map<String, dynamic> json) =>
      ShowMessagesResponse(
        success: json["success"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<Message>.from(json["data"]!.map((x) => Message.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}
