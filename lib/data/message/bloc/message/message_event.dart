part of 'message_bloc.dart';

@immutable
sealed class MessageEvent {}

final class FetchMessages extends MessageEvent {
  final int roomId;

  FetchMessages({required this.roomId});
}

final class NewMessageReceived extends MessageEvent {
  final String message;
  final UserModel createdBy;

  NewMessageReceived(this.createdBy, {required this.message});
}

final class NewMessageSended extends MessageEvent {
  final String message;

  NewMessageSended({required this.message});
}
