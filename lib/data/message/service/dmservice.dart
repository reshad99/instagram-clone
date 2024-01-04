import 'package:instagram_clone/data/message/repository/dmrepository.dart';
import 'package:instagram_clone/services/response/api_response.dart';

class DMService {
  final DMRepository dmRepository;

  DMService({required this.dmRepository});

  Future<ApiResponse> fetchRooms() {
    return dmRepository.fetchRooms();
  }

  Future<ApiResponse> fetchMessages(int roomId) {
    return dmRepository.fetchMessages(roomId);
  }
}
