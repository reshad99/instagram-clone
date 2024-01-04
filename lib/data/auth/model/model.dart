// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

import 'package:hive_flutter/adapters.dart';
part 'model.g.dart';

UserModel userFromJson(String str) => UserModel.fromJson(json.decode(str));

String userToJson(UserModel data) => json.encode(data.toJson());

@HiveType(typeId: 1)
class UserModel {
  @HiveField(0)
  int? id;

  @HiveField(1)
  String? username;

  @HiveField(2)
  String? email;

  @HiveField(3)
  String? phone;

  @HiveField(4)
  dynamic image;

  @HiveField(5)
  int? followerCount;

  @HiveField(6)
  int? followCount;

  @HiveField(7)
  int? postCount;

  @HiveField(8)
  dynamic thumbnailImage;

  @HiveField(9)
  bool? followed;

  UserModel({
    this.id,
    this.username,
    this.email,
    this.phone,
    this.image,
    this.followerCount,
    this.followCount,
    this.postCount,
    this.thumbnailImage,
    this.followed,
  });

  UserModel copyWith({
    int? id,
    String? username,
    String? email,
    String? phone,
    dynamic image,
    int? followerCount,
    int? followCount,
    int? postCount,
    dynamic thumbnailImage,
    dynamic followed,
  }) =>
      UserModel(
        id: id ?? this.id,
        username: username ?? this.username,
        email: email ?? this.email,
        phone: phone ?? this.phone,
        image: image ?? this.image,
        followerCount: followerCount ?? this.followerCount,
        followCount: image ?? this.followCount,
        postCount: image ?? this.postCount,
        thumbnailImage: thumbnailImage ?? this.thumbnailImage,
      );

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        username: json["username"],
        email: json["email"],
        phone: json["phone"],
        image: json["image"],
        followerCount: json["follower_count"],
        followCount: json["follow_count"],
        postCount: json["post_count"],
        thumbnailImage: json["thumbnail_image"],
        followed: json["followed"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "email": email,
        "phone": phone,
        "image": image,
        "follower_count": followerCount,
        "follow_count": followCount,
        "post_count": postCount,
        "thumbnail_image": thumbnailImage,
        "followed": followed,
      };
}
