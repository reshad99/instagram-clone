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
  dynamic thumbnailImage;

  UserModel({
    this.id,
    this.username,
    this.email,
    this.phone,
    this.image,
    this.thumbnailImage,
  });

  UserModel copyWith({
    int? id,
    String? username,
    String? email,
    String? phone,
    dynamic image,
    dynamic thumbnailImage,
  }) =>
      UserModel(
        id: id ?? this.id,
        username: username ?? this.username,
        email: email ?? this.email,
        phone: phone ?? this.phone,
        image: image ?? this.image,
        thumbnailImage: thumbnailImage ?? this.thumbnailImage,
      );

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        username: json["username"],
        email: json["email"],
        phone: json["phone"],
        image: json["image"],
        thumbnailImage: json["thumbnail_image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "email": email,
        "phone": phone,
        "image": image,
        "thumbnail_image": thumbnailImage,
      };
}
