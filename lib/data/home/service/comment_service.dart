import 'package:instagram_clone/data/home/repository/comment_repository.dart';
import 'package:instagram_clone/data/home/request/add_comment_request.dart';
import 'package:instagram_clone/services/response/api_response.dart';

class CommentService {
  final CommentRepository commentRepository;

  CommentService({required this.commentRepository});

  Future<ApiResponse> showComments(int postId) {
    return commentRepository.fetchComments(postId);
  }

  Future<ApiResponse> addComment(AddCommentRequest addCommentRequest) {
    return commentRepository.addComment(addCommentRequest);
  }
}
