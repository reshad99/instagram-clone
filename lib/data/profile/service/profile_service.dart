import 'package:instagram_clone/data/profile/repository/profile_repository.dart';
import 'package:instagram_clone/services/response/api_response.dart';

class ProfileService {
  final ProfileRepository profileRepository;

  ProfileService({required this.profileRepository});

  Future<ApiResponse> myPosts() async {
    return profileRepository.myPosts();
  }

  Future<ApiResponse> showPosts(int userId) async {
    return profileRepository.showPosts(userId);
  }

  Future<ApiResponse> showFollowers(int userId) async {
    return profileRepository.showFollowers(userId);
  }

  Future<ApiResponse> showFollows(int userId) async {
    return profileRepository.showFollows(userId);
  }

    Future<ApiResponse> showProfile(int userId) async {
    return profileRepository.showProfile(userId);
  }
}
