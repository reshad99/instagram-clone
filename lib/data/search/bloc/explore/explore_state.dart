part of 'explore_bloc.dart';

@immutable
sealed class ExploreState {}

final class ExploreInitial extends ExploreState {}

final class LatestPostsLoading extends ExploreState {}

final class LatestPostsError extends ExploreState {
  final ErrorResponse errorResponse;

  LatestPostsError({required this.errorResponse});
}

final class LatestPostsLoaded extends ExploreState {
  final List<Post> posts;

  LatestPostsLoaded({required this.posts});
}
