// To parse this JSON data, do
//
//     final postRequest = postRequestFromJson(jsonString);

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:image_cropper/image_cropper.dart';

PostRequest postRequestFromJson(String str) =>
    PostRequest.fromJson(json.decode(str));

String postRequestToJson(PostRequest data) => json.encode(data.toJson());

class PostRequest {
  List<CroppedFile> files;
  String? description;

  PostRequest({
    required this.files,
    this.description,
  });

  PostRequest copyWith({
    List<MultipartFile>? media,
    List<CroppedFile>? files,
    String? description,
  }) =>
      PostRequest(
        files: files ?? this.files,
        description: description ?? this.description,
      );

  factory PostRequest.fromJson(Map<String, dynamic> json) => PostRequest(
        files: json["files"] == null
            ? []
            : List<CroppedFile>.from(json["files"]!.map((x) => x)),
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "files": List<CroppedFile>.from(files.map((x) => x)),
        "description": description,
      };
}
