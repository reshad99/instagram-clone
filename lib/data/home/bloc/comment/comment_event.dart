part of 'comment_bloc.dart';

@immutable
sealed class CommentEvent {}

final class ShowComments extends CommentEvent {
  final int postId;

  ShowComments({required this.postId});
}

final class AddComment extends CommentEvent {
  final AddCommentRequest addCommentRequest;

  AddComment({required this.addCommentRequest});
}
