part of 'explore_bloc.dart';

@immutable
sealed class ExploreEvent {}

final class FetchLatestPosts extends ExploreEvent {}
