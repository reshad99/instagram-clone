part of 'status_bloc.dart';

@immutable
sealed class StatusEvent {}

final class FetchStatusesEvent extends StatusEvent {}

final class AddStoryEvent extends StatusEvent {
  final AddStoryRequest addStoryRequest;

  AddStoryEvent({required this.addStoryRequest});
}
