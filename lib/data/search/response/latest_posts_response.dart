// To parse this JSON data, do
//
//     final latestPostsResponse = latestPostsResponseFromJson(jsonString);

import 'dart:convert';

import 'package:instagram_clone/data/home/model/post.dart';
import 'package:instagram_clone/data/home/response/post_response.dart';
import 'package:instagram_clone/services/response/api_response.dart';

LatestPostsResponse latestPostsResponseFromJson(String str) => LatestPostsResponse.fromJson(json.decode(str));

String latestPostsResponseToJson(LatestPostsResponse data) => json.encode(data.toJson());

class LatestPostsResponse extends ApiResponse{
    bool? success;
    List<Post>? data;
    Meta? meta;

    LatestPostsResponse({
        this.success,
        this.data,
        this.meta,
    });

    LatestPostsResponse copyWith({
        bool? success,
        List<Post>? data,
        Meta? meta,
    }) => 
        LatestPostsResponse(
            success: success ?? this.success,
            data: data ?? this.data,
            meta: meta ?? this.meta,
        );

    factory LatestPostsResponse.fromJson(Map<String, dynamic> json) => LatestPostsResponse(
        success: json["success"],
        data: json["data"] == null ? [] : List<Post>.from(json["data"]!.map((x) => Post.fromJson(x))),
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
        "meta": meta?.toJson(),
    };
}


