// To parse this JSON data, do
//
//     final comment = commentFromJson(jsonString);

import 'dart:convert';

import 'package:instagram_clone/data/auth/model/model.dart';

Comment commentFromJson(String str) => Comment.fromJson(json.decode(str));

String commentToJson(Comment data) => json.encode(data.toJson());

class Comment {
  int? id;
  String? text;
  UserModel? user;
  String? timeDiff;

  Comment({
    this.id,
    this.text,
    this.user,
    this.timeDiff,
  });

  Comment copyWith({
    int? id,
    String? text,
    UserModel? user,
    String? timeDiff,
  }) =>
      Comment(
        id: id ?? this.id,
        text: text ?? this.text,
        user: user ?? this.user,
        timeDiff: timeDiff ?? this.timeDiff,
      );

  factory Comment.fromJson(Map<String, dynamic> json) => Comment(
        id: json["id"],
        text: json["text"],
        user: json["user"] == null ? null : UserModel.fromJson(json["user"]),
        timeDiff: json["timeDiff"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "text": text,
        "user": user?.toJson(),
        "timeDiff": timeDiff,
      };
}
