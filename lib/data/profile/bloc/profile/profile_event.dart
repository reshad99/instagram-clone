part of 'profile_bloc.dart';

@immutable
sealed class ProfileEvent {}

final class ShowProfile extends ProfileEvent {
  final int userId;

  ShowProfile({required this.userId});
}


final class ShowMyPosts extends ProfileEvent {}

final class ShowProfilePosts extends ProfileEvent {
  final int userId;

  ShowProfilePosts({required this.userId});
}
