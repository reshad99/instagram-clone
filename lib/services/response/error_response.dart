// To parse this JSON data, do
//
//     final errorResponse = errorResponseFromJson(jsonString);

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:instagram_clone/services/response/api_response.dart';

ErrorResponse errorResponseFromJson(String str) =>
    ErrorResponse.fromJson(json.decode(str));

String errorResponseToJson(ErrorResponse data) => json.encode(data.toJson());

class ErrorResponse extends ApiResponse {
  bool? success;
  int? statusCode;
  String? message;
  Errors? errors;

  ErrorResponse({
    this.success,
    this.statusCode,
    this.message,
    this.errors,
  });

  ErrorResponse copyWith({
    bool? success,
    int? statusCode,
    String? message,
    Errors? errors,
  }) =>
      ErrorResponse(
        success: success ?? this.success,
        statusCode: statusCode ?? this.statusCode,
        message: message ?? this.message,
        errors: errors ?? this.errors,
      );

  factory ErrorResponse.fromJson(Map<String, dynamic> json) {
    debugPrint("errorResponse formJson $json");
    return ErrorResponse(
      success: json["success"],
      statusCode: json["statusCode"],
      message: json["message"],
      errors: json["errors"] == null ? null : Errors.fromJson(json),
    );
  }

  Map<String, dynamic> toJson() => {
        "success": success,
        "statusCode": statusCode,
        "message": message,
        "errors": errors?.toJson(),
      };

  @override
  String toString() {
    // TODO: implement toString
    return '{"success": $success, "statusCode": $statusCode, "message": $message, "error": $errors}';
  }
}

class Errors {
  Map<String, List<dynamic>>? fields;

  Errors({
    this.fields,
  });

  Errors copyWith({
    Map<String, List<dynamic>>? fields,
  }) =>
      Errors(
        fields: fields ?? this.fields,
      );

  factory Errors.fromJson(Map<String, dynamic> json) {
    final Map<String, dynamic> errorData = json['errors'] ?? {};
    final Map<String, List<dynamic>> fields = {};

    errorData.forEach((key, value) {
      if (value is List<dynamic>) {
        fields[key] = value;
      } else if (value is String) {
        fields[key] = [value];
      }
    });

    return Errors(
      fields: fields.isNotEmpty ? fields : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};

    if (fields != null && fields!.isNotEmpty) {
      fields!.forEach((key, value) {
        if (value.length == 1) {
          data[key] = value.first;
        } else {
          data[key] = value;
        }
      });
    }

    return {
      'errors': data,
    };
  }

  @override
  String toString() {
    // TODO: implement toString
    return fields.toString();
  }
}
