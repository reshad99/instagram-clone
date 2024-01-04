part of 'message_bloc.dart';

@immutable
sealed class MessageState {}

final class MessageInitial extends MessageState {}

final class MessagesLoading extends MessageState {}

final class MessagesError extends MessageState {
  final ErrorResponse errorResponse;

  MessagesError({required this.errorResponse});
}

final class MessagesLoaded extends MessageState {
  final List<Message> messages;

  MessagesLoaded({required this.messages});
}
