import 'package:instagram_clone/core/mixins/authentication.dart';
import 'package:instagram_clone/data/home/const.dart';
import 'package:instagram_clone/data/home/request/add_comment_request.dart';
import 'package:instagram_clone/data/home/response/add_comment_response.dart';
import 'package:instagram_clone/data/home/response/comment_response.dart';
import 'package:instagram_clone/services/response/api_response.dart';
import 'package:instagram_clone/services/response/error_response.dart';

class CommentRepository with Authentication {

  Future<ApiResponse> fetchComments(int postId) async {
    final result = await apiService.sendRequest
        .get("$showComments/$postId", options: addOptions(token!));

    if (result.data['success'] == true) {
      return CommentResponse.fromJson(result.data);
    }

    return ErrorResponse.fromJson(result.data);
  }

  Future<ApiResponse> addComment(AddCommentRequest addCommentRequest) async {
    final result = await apiService.sendRequest.post(
        "$addCommentUrl/${addCommentRequest.id}",
        data: addCommentRequest.toJson(),
        options: addOptions(token!));

    if (result.data['success'] == true) {
      return AddCommentResponse.fromJson(result.data);
    }

    return ErrorResponse.fromJson(result.data);
  }
}
