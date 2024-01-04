import 'package:instagram_clone/core/mixins/authentication.dart';
import 'package:instagram_clone/data/profile/const.dart';
import 'package:instagram_clone/data/profile/response/my_posts_response.dart';
import 'package:instagram_clone/data/profile/response/show_followers_response.dart';
import 'package:instagram_clone/data/profile/response/show_follows_response.dart';
import 'package:instagram_clone/data/profile/response/show_posts_response.dart';
import 'package:instagram_clone/data/profile/response/show_profile_response.dart';
import 'package:instagram_clone/services/response/api_response.dart';
import 'package:instagram_clone/services/response/error_response.dart';

class ProfileRepository with Authentication {
  Future<ApiResponse> myPosts() async {
    final result = await apiService.sendRequest
        .get(myPostsUrl, options: addOptions(token!));
    if (result.data['success'] == true) {
      return MyPostsResponse.fromJson(result.data);
    }

    return ErrorResponse.fromJson(result.data);
  }

  Future<ApiResponse> showPosts(int userId) async {
    final result = await apiService.sendRequest
        .get("$showPostsUrl/$userId", options: addOptions(token!));
    if (result.data['success'] == true) {
      return ShowPostsResponse.fromJson(result.data);
    }

    return ErrorResponse.fromJson(result.data);
  }

  Future<ApiResponse> showFollowers(int userId) async {
    final result = await apiService.sendRequest
        .get("$showFollowersUrl/$userId", options: addOptions(token!));
    if (result.data['success'] == true) {
      return ShowFollowersResponse.fromJson(result.data);
    }

    return ErrorResponse.fromJson(result.data);
  }

  Future<ApiResponse> showFollows(int userId) async {
    final result = await apiService.sendRequest
        .get("$showFollowsUrl/$userId", options: addOptions(token!));
    if (result.data['success'] == true) {
      return ShowFollowsResponse.fromJson(result.data);
    }

    return ErrorResponse.fromJson(result.data);
  }

  Future<ApiResponse> showProfile(int userId) async {
    final result = await apiService.sendRequest
        .get("$showProfileUrl/$userId", options: addOptions(token!));
    if (result.data['success'] == true) {
      return ShowProfileResponse.fromJson(result.data);
    }

    return ErrorResponse.fromJson(result.data);
  }
}
