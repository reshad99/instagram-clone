import 'package:instagram_clone/data/home/repository/post_repository.dart';
import 'package:instagram_clone/data/home/request/post_request.dart';
import 'package:instagram_clone/services/response/api_response.dart';

class PostService {
  final PostRepository postRepository;

  PostService({required this.postRepository});

  Future<ApiResponse> getPosts() {
    return postRepository.fetchPosts();
  }

  Future<ApiResponse> addPost(PostRequest postRequest) {
    return postRepository.addPost(postRequest);
  }

  Future<bool> likePost(int postId) {
    return postRepository.likePost(postId);
  }
}
