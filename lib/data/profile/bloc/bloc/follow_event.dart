part of 'follow_bloc.dart';

@immutable
sealed class FollowEvent {}

final class ShowFollowers extends FollowEvent {
  final int userId;

  ShowFollowers({required this.userId});
}

final class ShowFollows extends FollowEvent {
  final int userId;

  ShowFollows({required this.userId});
}
