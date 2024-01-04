// To parse this JSON data, do
//
//     final room = roomFromJson(jsonString);

import 'dart:convert';

import 'package:instagram_clone/data/auth/model/model.dart';
import 'package:instagram_clone/data/message/model/message.dart';

Room roomFromJson(String str) => Room.fromJson(json.decode(str));

String roomToJson(Room data) => json.encode(data.toJson());

class Room {
    int? id;
    String? uid;
    UserModel? myMate;
    Message? lastMessage;

    Room({
        this.id,
        this.uid,
        this.myMate,
        this.lastMessage,
    });

    Room copyWith({
        int? id,
        String? uid,
        UserModel? myMate,
        Message? lastMessage,
    }) => 
        Room(
            id: id ?? this.id,
            uid: uid ?? this.uid,
            myMate: myMate ?? this.myMate,
            lastMessage: lastMessage ?? this.lastMessage,
        );

    factory Room.fromJson(Map<String, dynamic> json) => Room(
        id: json["id"],
        uid: json["uid"],
        myMate: json["myMate"] == null ? null : UserModel.fromJson(json["myMate"]),
        lastMessage: json["lastMessage"] == null ? null : Message.fromJson(json["lastMessage"])
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "uid": uid,
        "myMate": myMate?.toJson(),
        "lastMessage": lastMessage?.toJson(),
    };
}
