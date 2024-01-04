import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/core/mixins/authentication.dart';
import 'package:instagram_clone/data/home/const.dart';
import 'package:instagram_clone/data/home/request/add_story_request.dart';
import 'package:instagram_clone/data/home/response/add_story_response.dart';
import 'package:instagram_clone/data/home/response/get_statuses_response.dart';
import 'package:instagram_clone/services/response/api_response.dart';
import 'package:instagram_clone/services/response/error_response.dart';

class StatusRepository with Authentication {
  
  Future<ApiResponse> fetchStatuses() async {
    final result = await apiService.sendRequest
        .get(getStatuses, options: addOptions(token!));
    if (result.data['success'] == true) {
      debugPrint('status request is success');
      return GetStatusesResponse.fromJson(result.data);
    }

    return ErrorResponse.fromJson(result.data);
  }

  Future<ApiResponse> addStory(AddStoryRequest addStoryRequest) async {
    final freshFile = await MultipartFile.fromFile(addStoryRequest.media!.path);

    var formData = FormData.fromMap({
      "media": freshFile,
      "position": jsonEncode(addStoryRequest.position),
      "text": addStoryRequest.text
    });

    final result = await apiService.sendRequest
        .post(addStoryUrl, data: formData, options: addOptions(token!));

    if (result.data['success'] == true) {
      return AddStoryResponse.fromJson(result.data);
    }

    return ErrorResponse.fromJson(result.data);
  }
}
