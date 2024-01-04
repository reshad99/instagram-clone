// To parse this JSON data, do
//
//     final message = messageFromJson(jsonString);

import 'dart:convert';

import 'package:instagram_clone/data/auth/model/model.dart';

Message messageFromJson(String str) => Message.fromJson(json.decode(str));

String messageToJson(Message data) => json.encode(data.toJson());

class Message {
    int? id;
    String? messageType;
    String? message;
    bool? isMine;
    UserModel? createdBy;
    String? timeDiff;

    Message({
        this.id,
        this.messageType,
        this.message,
        this.isMine,
        this.createdBy,
        this.timeDiff,
    });

    Message copyWith({
        int? id,
        String? messageType,
        String? message,
        bool? isMine,
        UserModel? createdBy,
        String? timeDiff,
    }) => 
        Message(
            id: id ?? this.id,
            messageType: messageType ?? this.messageType,
            message: message ?? this.message,
            isMine: isMine ?? this.isMine,
            createdBy: createdBy ?? this.createdBy,
            timeDiff: timeDiff ?? this.timeDiff,
        );

    factory Message.fromJson(Map<String, dynamic> json) => Message(
        id: json["id"],
        messageType: json["messageType"],
        message: json["message"],
        isMine: json["isMine"],
        createdBy: json["createdBy"] == null ? null : UserModel.fromJson(json["createdBy"]),
        timeDiff: json["timeDiff"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "messageType": messageType,
        "message": message,
        "isMine": isMine,
        "createdBy": createdBy?.toJson(),
        "timeDiff": timeDiff,
    };
}


