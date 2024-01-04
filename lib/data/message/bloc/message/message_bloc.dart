import 'package:bloc/bloc.dart';
import 'package:instagram_clone/data/auth/model/model.dart';
import 'package:instagram_clone/data/message/model/message.dart';
import 'package:instagram_clone/data/message/repository/dmrepository.dart';
import 'package:instagram_clone/data/message/response/show_messages_response.dart';
import 'package:instagram_clone/data/message/service/dmservice.dart';
import 'package:instagram_clone/services/response/error_response.dart';
import 'package:meta/meta.dart';

part 'message_event.dart';
part 'message_state.dart';

class MessageBloc extends Bloc<MessageEvent, MessageState> {
  final DMService dmService = DMService(dmRepository: DMRepository());
  MessageBloc() : super(MessageInitial()) {
    on<FetchMessages>((event, emit) async {
      try {
        emit(MessagesLoading());
        final result = await dmService.fetchMessages(event.roomId);
        if (result is ShowMessagesResponse) {
          emit(MessagesLoaded(messages: result.data!));
        } else if (result is ErrorResponse) {
          emit(MessagesError(errorResponse: result));
        }
      } catch (e) {
        emit(
            MessagesError(errorResponse: ErrorResponse(message: e.toString())));
      }
    });

    on<NewMessageReceived>((event, emit) async {
      try {
        final currentState = state;
        if (currentState is MessagesLoaded) {
          Message message = Message(
              message: event.message,
              isMine: false,
              createdBy: event.createdBy);
          List<Message> newState = List.from(currentState.messages)
            ..insert(0, message);
          emit(MessagesLoaded(messages: newState));
        }
      } catch (e) {
        emit(
            MessagesError(errorResponse: ErrorResponse(message: e.toString())));
      }
    });

    on<NewMessageSended>((event, emit) async {
      try {
        final currentState = state;
        if (currentState is MessagesLoaded) {
          Message message = Message(
            message: event.message,
            isMine: true,
          );
          List<Message> newState = List.from(currentState.messages)
            ..insert(0, message);
          emit(MessagesLoaded(messages: newState));
        }
      } catch (e) {
        emit(
            MessagesError(errorResponse: ErrorResponse(message: e.toString())));
      }
    });
  }
}
