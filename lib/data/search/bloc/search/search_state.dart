part of 'search_bloc.dart';

@immutable
sealed class SearchState {}

final class SearchInitial extends SearchState {}

final class SearchLoading extends SearchState {}

final class SearchError extends SearchState {
  final ErrorResponse errorResponse;

  SearchError({required this.errorResponse});
}

final class SearchLoaded extends SearchState {
  final List<UserModel> users;

  SearchLoaded({required this.users});
}
