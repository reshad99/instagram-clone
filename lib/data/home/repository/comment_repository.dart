import 'package:dio/dio.dart';
import 'package:instagram_clone/data/home/const.dart';
import 'package:instagram_clone/data/home/request/add_comment_request.dart';
import 'package:instagram_clone/data/home/response/add_comment_response.dart';
import 'package:instagram_clone/data/home/response/comment_response.dart';
import 'package:instagram_clone/services/api/api_service.dart';
import 'package:instagram_clone/services/local_database/local_database.dart';
import 'package:instagram_clone/services/locator.dart';
import 'package:instagram_clone/services/response/api_response.dart';
import 'package:instagram_clone/services/response/error_response.dart';

class CommentRepository {
  final localDB = locator<LocalDatabase>();
  final apiService = ApiService();
  final token =
      "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL2luc3RhZ3JhbS5iYWt1ZGV2cy5jb20vYXBpL2N1c3RvbWVyL3YxL3JlZ2lzdGVyIiwiaWF0IjoxNjk2NTA3NDM2LCJuYmYiOjE2OTY1MDc0MzYsImp0aSI6Ik9RQmd5b1dwMVRUR1dRS2ciLCJzdWIiOiIxIiwicHJ2IjoiMWQwYTAyMGFjZjVjNGI2YzQ5Nzk4OWRmMWFiZjBmYmQ0ZThjOGQ2MyJ9.ooL3OdoN0o2jf-LgozZXa8wYWKRY1kJDGIWgR5scz_Q";

  Future<ApiResponse> fetchComments(int postId) async {
    final result = await apiService.sendRequest
        .get("$showComments/$postId", options: addOptions(token));

    if (result.data['success'] == true) {
      return CommentResponse.fromJson(result.data);
    }

    return ErrorResponse.fromJson(result.data);
  }

  Future<ApiResponse> addComment(AddCommentRequest addCommentRequest) async {
    final result = await apiService.sendRequest.post(
        "$addCommentUrl/${addCommentRequest.id}",
        data: addCommentRequest.toJson(),
        options: addOptions(token));

    if (result.data['success'] == true) {
      return AddCommentResponse.fromJson(result.data);
    }

    return ErrorResponse.fromJson(result.data);
  }

  Options addOptions(String token) {
    return Options(headers: {'Authorization': 'Bearer $token'});
  }
}
