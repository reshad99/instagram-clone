part of 'search_bloc.dart';

@immutable
sealed class SearchEvent {}

final class TrySearch extends SearchEvent {
  final String query;

  TrySearch({required this.query});
}
