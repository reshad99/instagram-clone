// To parse this JSON data, do
//
//     final addCommentRequest = addCommentRequestFromJson(jsonString);

import 'dart:convert';

AddCommentRequest addCommentRequestFromJson(String str) =>
    AddCommentRequest.fromJson(json.decode(str));

String addCommentRequestToJson(AddCommentRequest data) =>
    json.encode(data.toJson());

class AddCommentRequest {
  int? id;
  String? text;

  AddCommentRequest({
    this.id,
    this.text,
  });

  AddCommentRequest copyWith({
    int? id,
    String? text,
  }) =>
      AddCommentRequest(
        id: id ?? this.id,
        text: text ?? this.text,
      );

  factory AddCommentRequest.fromJson(Map<String, dynamic> json) =>
      AddCommentRequest(
        id: json["id"],
        text: json["text"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "text": text,
      };
}
