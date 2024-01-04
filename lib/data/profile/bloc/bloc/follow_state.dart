part of 'follow_bloc.dart';

sealed class FollowState {}

final class FollowInitial extends FollowState {}

final class FollowLoading extends FollowState {}

final class FollowError extends FollowState {
  final ErrorResponse errorResponse;

  FollowError({required this.errorResponse});
}

final class FollowersLoaded extends FollowState {
  ShowFollowersResponse showFollowersResponse;

  FollowersLoaded({required this.showFollowersResponse});
}

final class FollowsLoaded extends FollowState {
  ShowFollowsResponse showFollowsResponse;

  FollowsLoaded({required this.showFollowsResponse});
}
