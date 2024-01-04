// To parse this JSON data, do
//
//     final showRoomsResponse = showRoomsResponseFromJson(jsonString);

import 'dart:convert';

import 'package:instagram_clone/data/message/model/room.dart';
import 'package:instagram_clone/services/response/api_response.dart';

ShowRoomsResponse showRoomsResponseFromJson(String str) => ShowRoomsResponse.fromJson(json.decode(str));

String showRoomsResponseToJson(ShowRoomsResponse data) => json.encode(data.toJson());

class ShowRoomsResponse extends ApiResponse {
    bool? success;
    String? message;
    List<Room>? data;

    ShowRoomsResponse({
        this.success,
        this.message,
        this.data,
    });

    ShowRoomsResponse copyWith({
        bool? success,
        String? message,
        List<Room>? data,
    }) => 
        ShowRoomsResponse(
            success: success ?? this.success,
            message: message ?? this.message,
            data: data ?? this.data,
        );

    factory ShowRoomsResponse.fromJson(Map<String, dynamic> json) => ShowRoomsResponse(
        success: json["success"],
        message: json["message"],
        data: json["data"] == null ? [] : List<Room>.from(json["data"]!.map((x) => Room.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

