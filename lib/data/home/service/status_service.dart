import 'package:instagram_clone/data/home/repository/status_repository.dart';
import 'package:instagram_clone/data/home/request/add_story_request.dart';
import 'package:instagram_clone/services/response/api_response.dart';

class StatusService {
  final StatusRepository statusRepository;

  StatusService({required this.statusRepository});

  Future<ApiResponse> fetchStatuses() {
    return statusRepository.fetchStatuses();
  }

  Future<ApiResponse> addStory(AddStoryRequest addStoryRequest) {
    return statusRepository.addStory(addStoryRequest);
  }
}
