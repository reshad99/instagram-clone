part of 'post_bloc.dart';

@immutable
sealed class PostEvent {}

final class FetchPosts extends PostEvent {}

final class AddPost extends PostEvent {
  final PostRequest postRequest;

  AddPost({required this.postRequest});
}



final class LikePost extends PostEvent {
  final int postId;

  LikePost({required this.postId});
}
