import 'package:instagram_clone/data/search/repository/explore_repository.dart';
import 'package:instagram_clone/services/response/api_response.dart';

class ExploreService {
  final ExploreRepository exploreRepository;

  ExploreService({required this.exploreRepository});

  Future<ApiResponse> latestPosts() async {
    return exploreRepository.latestPosts();
  }

  Future<ApiResponse> search(String query) async {
    return exploreRepository.search(query);
  }
}
