part of 'post_bloc.dart';

@immutable
sealed class PostState {}

final class PostInitial extends PostState {}

final class PostLoading extends PostState {}

final class PostError extends PostState {
  final ErrorResponse errorResponse;

  PostError({required this.errorResponse});
}

final class PostLoaded extends PostState {
  final List<Post> posts;

  PostLoaded({required this.posts});
}


//comments

