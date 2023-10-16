part of 'comment_bloc.dart';

@immutable
sealed class CommentState {}

final class CommentInitial extends CommentState {}

final class CommentsLoading extends CommentState {}

final class CommentsError extends CommentState {
  final ErrorResponse errorResponse;

  CommentsError({required this.errorResponse});
}

final class CommentsLoaded extends CommentState {
  final List<Comment> comments;

  CommentsLoaded({required this.comments});
}
