// To parse this JSON data, do
//
//     final post = postFromJson(jsonString);

import 'dart:convert';

import 'package:hive_flutter/adapters.dart';
import 'package:instagram_clone/data/auth/model/model.dart';
import 'package:instagram_clone/presentation/models/media.dart';
part 'post.g.dart';

Post postFromJson(String str) => Post.fromJson(json.decode(str));

String postToJson(Post data) => json.encode(data.toJson());

@HiveType(typeId: 2)
class Post {
  @HiveField(0)
  int? id;
  @HiveField(1)
  String? description;
  @HiveField(2)
  int? likes;
  @HiveField(3)
  int? comments;
  @HiveField(4)
  bool? liked;
  @HiveField(5)
  UserModel? user;
  @HiveField(6)
  List<Media>? media;

  Post({
    this.id,
    this.description,
    this.likes,
    this.comments,
    this.liked,
    this.user,
    this.media,
  });

  Post copyWith({
    int? id,
    String? description,
    int? likes,
    int? comments,
    bool? liked,
    UserModel? user,
    List<Media>? media,
  }) =>
      Post(
        id: id ?? this.id,
        description: description ?? this.description,
        likes: likes ?? this.likes,
        comments: comments ?? this.comments,
        liked: liked ?? this.liked,
        user: user ?? this.user,
        media: media ?? this.media,
      );

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        id: json["id"],
        description: json["description"],
        likes: json["likes"],
        comments: json["comments"],
        liked: json["liked"],
        user: json["user"] == null ? null : UserModel.fromJson(json["user"]),
        media: json["media"] == null
            ? []
            : List<Media>.from(json["media"]!.map((x) => Media.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "description": description,
        "likes": likes,
        "comments": comments,
        "liked": liked,
        "user": user?.toJson(),
        "media": media == null
            ? []
            : List<dynamic>.from(media!.map((x) => x.toJson())),
      };
}
