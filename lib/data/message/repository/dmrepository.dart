import 'package:instagram_clone/core/mixins/authentication.dart';
import 'package:instagram_clone/data/message/const.dart';
import 'package:instagram_clone/data/message/response/show_messages_response.dart';
import 'package:instagram_clone/data/message/response/show_rooms_response.dart';
import 'package:instagram_clone/services/response/api_response.dart';
import 'package:instagram_clone/services/response/error_response.dart';

class DMRepository with Authentication {
  Future<ApiResponse> fetchRooms() async {
    final result = await apiService.sendRequest
        .get(fetchRoomsUrl, options: addOptions(token!));

    if (result.data['success'] == true) {
      return ShowRoomsResponse.fromJson(result.data);
    }

    return ErrorResponse.fromJson(result.data);
  }

  Future<ApiResponse> fetchMessages(int roomId) async {
    final result = await apiService.sendRequest
        .get('$fetchMessagesUrl/$roomId', options: addOptions(token!));

    if (result.data['success'] == true) {
      return ShowMessagesResponse.fromJson(result.data);
    }

    return ErrorResponse.fromJson(result.data);
  }
}
