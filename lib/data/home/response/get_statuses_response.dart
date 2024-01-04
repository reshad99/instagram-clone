// To parse this JSON data, do
//
//     final getStatusesResponse = getStatusesResponseFromJson(jsonString);

import 'dart:convert';

import 'package:instagram_clone/data/home/model/status.dart';
import 'package:instagram_clone/services/response/api_response.dart';

GetStatusesResponse getStatusesResponseFromJson(String str) => GetStatusesResponse.fromJson(json.decode(str));

String getStatusesResponseToJson(GetStatusesResponse data) => json.encode(data.toJson());

class GetStatusesResponse extends ApiResponse {
    bool? success;
    String? message;
    List<Status>? data;

    GetStatusesResponse({
        this.success,
        this.message,
        this.data,
    });

    GetStatusesResponse copyWith({
        bool? success,
        String? message,
        List<Status>? data,
    }) => 
        GetStatusesResponse(
            success: success ?? this.success,
            message: message ?? this.message,
            data: data ?? this.data,
        );

    factory GetStatusesResponse.fromJson(Map<String, dynamic> json) => GetStatusesResponse(
        success: json["success"],
        message: json["message"],
        data: json["data"] == null ? [] : List<Status>.from(json["data"]!.map((x) => Status.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}
