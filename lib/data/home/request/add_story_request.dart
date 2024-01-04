// To parse this JSON data, do
//
//     final addStoryRequest = addStoryRequestFromJson(jsonString);

import 'dart:convert';

import 'package:image_picker/image_picker.dart';

AddStoryRequest addStoryRequestFromJson(String str) =>
    AddStoryRequest.fromJson(json.decode(str));

String addStoryRequestToJson(AddStoryRequest data) =>
    json.encode(data.toJson());

class AddStoryRequest {
  String? text;
  XFile? media;
  Map<String, dynamic>? position;

  AddStoryRequest({
    this.text,
    this.media,
    this.position,
  });

  AddStoryRequest copyWith({
    String? text,
    XFile? media,
    Map<String, dynamic>? position,
  }) =>
      AddStoryRequest(
        text: text ?? this.text,
        media: media ?? this.media,
        position: position ?? this.position,
      );

  factory AddStoryRequest.fromJson(Map<String, dynamic> json) =>
      AddStoryRequest(
        text: json["text"],
        media: json["media"],
        position: json["position"],
      );

  Map<String, dynamic> toJson() => {
        "text": text,
        "media": media,
        "position": position,
      };
}
