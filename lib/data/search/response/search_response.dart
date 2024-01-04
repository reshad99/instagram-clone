// To parse this JSON data, do
//
//     final searchResponse = searchResponseFromJson(jsonString);

import 'dart:convert';

import 'package:instagram_clone/data/auth/model/model.dart';
import 'package:instagram_clone/data/home/response/post_response.dart';
import 'package:instagram_clone/services/response/api_response.dart';

SearchResponse searchResponseFromJson(String str) =>
    SearchResponse.fromJson(json.decode(str));

String searchResponseToJson(SearchResponse data) => json.encode(data.toJson());

class SearchResponse extends ApiResponse {
  bool? success;
  List<UserModel>? data;
  Meta? meta;

  SearchResponse({
    this.success,
    this.data,
    this.meta,
  });

  SearchResponse copyWith({
    bool? success,
    List<UserModel>? data,
    Meta? meta,
  }) =>
      SearchResponse(
        success: success ?? this.success,
        data: data ?? this.data,
        meta: meta ?? this.meta,
      );

  factory SearchResponse.fromJson(Map<String, dynamic> json) => SearchResponse(
        success: json["success"],
        data: json["data"] == null
            ? []
            : List<UserModel>.from(
                json["data"]!.map((x) => UserModel.fromJson(x))),
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
        "meta": meta?.toJson(),
      };
}
