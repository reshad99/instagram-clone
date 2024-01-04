part of 'status_bloc.dart';

@immutable
sealed class StatusState {}

final class StatusInitial extends StatusState {}

final class StatusLoading extends StatusState {}

final class StatusLoaded extends StatusState {
  final List<Status>? statuses;

  StatusLoaded({required this.statuses});
}

final class StatusError extends StatusState {
  final ErrorResponse errorResponse;

  StatusError({required this.errorResponse});
}
