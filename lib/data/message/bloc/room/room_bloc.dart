import 'package:bloc/bloc.dart';
import 'package:instagram_clone/data/message/model/room.dart';
import 'package:instagram_clone/data/message/repository/dmrepository.dart';
import 'package:instagram_clone/data/message/response/show_rooms_response.dart';
import 'package:instagram_clone/data/message/service/dmservice.dart';
import 'package:instagram_clone/services/response/error_response.dart';
import 'package:meta/meta.dart';

part 'room_event.dart';
part 'room_state.dart';

class RoomBloc extends Bloc<RoomEvent, RoomState> {
  final DMService dmService = DMService(dmRepository: DMRepository());
  RoomBloc() : super(RoomInitial()) {
    on<FetchRooms>((event, emit) async {
      try {
        emit(RoomsLoading());
        final result = await dmService.fetchRooms();
        if (result is ShowRoomsResponse) {
          emit(RoomsLoaded(rooms: result.data!));
        } else if (result is ErrorResponse) {
          emit(RoomsError(errorResponse: result));
        }
      } catch (e) {
        emit(RoomsError(errorResponse: ErrorResponse(message: e.toString())));
      }
    });
  }
}
