import 'package:instagram_clone/core/mixins/authentication.dart';
import 'package:instagram_clone/data/search/const.dart';
import 'package:instagram_clone/data/search/response/latest_posts_response.dart';
import 'package:instagram_clone/data/search/response/search_response.dart';
import 'package:instagram_clone/services/response/api_response.dart';
import 'package:instagram_clone/services/response/error_response.dart';

class ExploreRepository with Authentication {
  Future<ApiResponse> latestPosts() async {
    final result = await apiService.sendRequest
        .get(latestPostsUrl, options: addOptions(token!));
    if (result.data['success'] == true) {
      return LatestPostsResponse.fromJson(result.data);
    }

    return ErrorResponse.fromJson(result.data);
  }

  Future<ApiResponse> search(String query) async {
    final result = await apiService.sendRequest
        .get("$searchUrl/$query", options: addOptions(token!));
    if (result.data['success'] == true) {
      return SearchResponse.fromJson(result.data);
    }

    return ErrorResponse.fromJson(result.data);
  }
}
