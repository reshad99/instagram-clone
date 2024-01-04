import 'package:dio/dio.dart';
import 'package:instagram_clone/core/mixins/authentication.dart';
import 'package:instagram_clone/data/home/const.dart';
import 'package:instagram_clone/data/home/request/post_request.dart';
import 'package:instagram_clone/data/home/response/add_post_response.dart';
import 'package:instagram_clone/data/home/response/post_response.dart';
import 'package:instagram_clone/services/response/api_response.dart';
import 'package:instagram_clone/services/response/error_response.dart';

class PostRepository with Authentication {
  Future<ApiResponse> fetchPosts() async {
    final result =
        await apiService.sendRequest.get(getPosts, options: addOptions(token!));

    if (result.data['success'] == true) {
      return PostResponse.fromJson(result.data);
    }

    return ErrorResponse.fromJson(result.data);
  }

  Future<ApiResponse> addPost(PostRequest postRequest) async {
    var formData = FormData();

    for (var file in postRequest.files) {
      // Create a new MultipartFile from the bytes for each request
      final freshFile = await MultipartFile.fromFile(file.path);

      formData.files.add(MapEntry("media[]", freshFile));
    }

    if (postRequest.description != null) {
      formData.fields.add(MapEntry("description", postRequest.description!));
    }

    final result = await apiService.sendRequest
        .post(addPostUrl, data: formData, options: addOptions(token!));

    if (result.data['success'] == true) {
      return AddPostResponse.fromJson(result.data);
    }

    return ErrorResponse.fromJson(result.data);
  }

  Future<bool> likePost(int postId) async {
    final result = await apiService.sendRequest
        .get("$likePostUrl/$postId", options: addOptions(token!));

    if (result.data['success'] == true) {
      return true;
    }

    return false;
  }
}
