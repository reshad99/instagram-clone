part of 'room_bloc.dart';

@immutable
sealed class RoomState {}

final class RoomInitial extends RoomState {}

final class RoomsLoading extends RoomState {}

final class RoomsError extends RoomState {
  final ErrorResponse errorResponse;

  RoomsError({required this.errorResponse});
}

final class RoomsLoaded extends RoomState {
  final List<Room> rooms;

  RoomsLoaded({required this.rooms});
}
