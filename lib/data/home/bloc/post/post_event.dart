part of 'post_bloc.dart';

@immutable
sealed class PostEvent {}

final class FetchPosts extends PostEvent {}

final class LikePost extends PostEvent {}
