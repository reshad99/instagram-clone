import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/data/home/const.dart';
import 'package:instagram_clone/data/home/response/post_response.dart';
import 'package:instagram_clone/services/api/api_service.dart';
import 'package:instagram_clone/services/local_database/local_database.dart';
import 'package:instagram_clone/services/locator.dart';
import 'package:instagram_clone/services/response/api_response.dart';
import 'package:instagram_clone/services/response/error_response.dart';

class PostRepository {
  final localDB = locator<LocalDatabase>();
  final apiService = ApiService();
  final token =
      "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL2luc3RhZ3JhbS5iYWt1ZGV2cy5jb20vYXBpL2N1c3RvbWVyL3YxL3JlZ2lzdGVyIiwiaWF0IjoxNjk2NTA3NDM2LCJuYmYiOjE2OTY1MDc0MzYsImp0aSI6Ik9RQmd5b1dwMVRUR1dRS2ciLCJzdWIiOiIxIiwicHJ2IjoiMWQwYTAyMGFjZjVjNGI2YzQ5Nzk4OWRmMWFiZjBmYmQ0ZThjOGQ2MyJ9.ooL3OdoN0o2jf-LgozZXa8wYWKRY1kJDGIWgR5scz_Q";

  Future<ApiResponse> fetchPosts() async {
    debugPrint('this is token $token');
    final result =
        await apiService.sendRequest.get(getPosts, options: addOptions(token));

    if (result.data['success'] == true) {
      return PostResponse.fromJson(result.data);
    }

    return ErrorResponse.fromJson(result.data);
  }

  Future<bool> likePost(int postId) async {
    final result = await apiService.sendRequest
        .get("$likePostUrl/$postId", options: addOptions(token));

    if (result.data['success'] == true) {
      return true;
    }

    return false;
  }

  Options addOptions(String token) {
    return Options(headers: {'Authorization': 'Bearer $token'});
  }
}
