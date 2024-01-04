// To parse this JSON data, do
//
//     final status = statusFromJson(jsonString);

import 'dart:convert';

import 'package:instagram_clone/data/auth/model/model.dart';
import 'package:instagram_clone/data/home/model/story.dart';

Status statusFromJson(String str) => Status.fromJson(json.decode(str));

String statusToJson(Status data) => json.encode(data.toJson());

class Status {
    int? id;
    bool? viewed;
    int? count;
    UserModel? customer;
    List<Story>? stories;

    Status({
        this.id,
        this.viewed,
        this.count,
        this.customer,
        this.stories,
    });

    Status copyWith({
        int? id,
        bool? viewed,
        int? count,
        UserModel? customer,
        List<Story>? stories,
    }) => 
        Status(
            id: id ?? this.id,
            viewed: viewed ?? this.viewed,
            count: count ?? this.count,
            customer: customer ?? this.customer,
            stories: stories ?? this.stories,
        );

    factory Status.fromJson(Map<String, dynamic> json) => Status(
        id: json["id"],
        viewed: json["viewed"],
        count: json["count"],
        customer: json["customer"] == null ? null : UserModel.fromJson(json["customer"]),
        stories: json["stories"] == null ? [] : List<Story>.from(json["stories"]!.map((x) => Story.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "viewed": viewed,
        "count": count,
        "customer": customer?.toJson(),
        "stories": stories == null ? [] : List<dynamic>.from(stories!.map((x) => x.toJson())),
    };
}


