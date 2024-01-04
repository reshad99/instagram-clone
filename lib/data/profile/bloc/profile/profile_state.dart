part of 'profile_bloc.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

final class ProfileLoading extends ProfileState {}

final class MyProfileLoading extends ProfileState {}

final class MyProfilePostsLoading extends ProfileState {}

final class MyProfilePostsLoaded extends ProfileState {
  final List<Post> posts;

  MyProfilePostsLoaded({required this.posts});
}

final class ProfilePostsLoading extends ProfileState {}

final class ProfilePostsLoaded extends ProfileState {
  final List<Post> posts;

  ProfilePostsLoaded({required this.posts});
}

final class ProfileError extends ProfileState {
  final ErrorResponse errorResponse;

  ProfileError({required this.errorResponse});
}

final class MyProfileError extends ProfileState {
  final ErrorResponse errorResponse;

  MyProfileError({required this.errorResponse});
}

final class ProfileLoaded extends ProfileState {
  final UserModel userModel;

  ProfileLoaded({required this.userModel});
}

final class MyProfileLoaded extends ProfileState {
  final UserModel userModel;

  MyProfileLoaded({required this.userModel});
}
