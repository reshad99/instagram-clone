// To parse this JSON data, do
//
//     final post = postFromJson(jsonString);

import 'dart:convert';

import 'package:instagram_clone/data/home/model/post.dart';
import 'package:instagram_clone/services/response/api_response.dart';

PostResponse postFromJson(String str) =>
    PostResponse.fromJson(json.decode(str));

String postToJson(PostResponse data) => json.encode(data.toJson());

class PostResponse extends ApiResponse {
  bool? success;
  List<Post>? data;
  Meta? meta;

  PostResponse({
    this.success,
    this.data,
    this.meta,
  });

  PostResponse copyWith({
    bool? success,
    List<Post>? data,
    Meta? meta,
  }) =>
      PostResponse(
        success: success ?? this.success,
        data: data ?? this.data,
        meta: meta ?? this.meta,
      );

  factory PostResponse.fromJson(Map<String, dynamic> json) => PostResponse(
        success: json["success"],
        data: json["data"] == null
            ? []
            : List<Post>.from(json["data"]!.map((x) => Post.fromJson(x))),
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

class Meta {
  int? total;
  int? count;
  int? perPage;
  int? currentPage;
  int? totalPages;
  dynamic nextPageUrl;

  Meta({
    this.total,
    this.count,
    this.perPage,
    this.currentPage,
    this.totalPages,
    this.nextPageUrl,
  });

  Meta copyWith({
    int? total,
    int? count,
    int? perPage,
    int? currentPage,
    int? totalPages,
    dynamic nextPageUrl,
  }) =>
      Meta(
        total: total ?? this.total,
        count: count ?? this.count,
        perPage: perPage ?? this.perPage,
        currentPage: currentPage ?? this.currentPage,
        totalPages: totalPages ?? this.totalPages,
        nextPageUrl: nextPageUrl ?? this.nextPageUrl,
      );

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        total: json["total"],
        count: json["count"],
        perPage: json["per_page"],
        currentPage: json["current_page"],
        totalPages: json["total_pages"],
        nextPageUrl: json["next_page_url"],
      );

  Map<String, dynamic> toJson() => {
        "total": total,
        "count": count,
        "per_page": perPage,
        "current_page": currentPage,
        "total_pages": totalPages,
        "next_page_url": nextPageUrl,
      };
}
