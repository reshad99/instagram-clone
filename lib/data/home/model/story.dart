// To parse this JSON data, do
//
//     final story = storyFromJson(jsonString);

import 'dart:convert';

import 'package:instagram_clone/data/home/model/position.dart';
import 'package:instagram_clone/presentation/models/media.dart';

Story storyFromJson(String str) => Story.fromJson(json.decode(str));

String storyToJson(Story data) => json.encode(data.toJson());

class Story {
    int? id;
    Position? position;
    int? statusId;
    String? text;
    Media? media;
    String? time;
    bool? viewed;

    Story({
        this.id,
        this.position,
        this.statusId,
        this.text,
        this.media,
        this.time,
        this.viewed,
    });

    Story copyWith({
        int? id,
        Position? position,
        int? statusId,
        String? text,
        Media? media,
        String? time,
        bool? viewed,
    }) => 
        Story(
            id: id ?? this.id,
            position: position ?? this.position,
            statusId: statusId ?? this.statusId,
            text: text ?? this.text,
            media: media ?? this.media,
            time: time ?? this.time,
            viewed: viewed ?? this.viewed,
        );

    factory Story.fromJson(Map<String, dynamic> json) => Story(
        id: json["id"],
        position: json["position"] == null ? null : Position.fromJson(json["position"]),
        statusId: json["status_id"],
        text: json["text"],
        media: json["media"] == null ? null : Media.fromJson(json["media"]),
        time: json["time"],
        viewed: json["viewed"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "position": position?.toJson(),
        "status_id": statusId,
        "text": text,
        "media": media?.toJson(),
        "time": time,
        "viewed": viewed,
    };
}


