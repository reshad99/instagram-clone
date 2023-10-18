part of 'file_bloc.dart';

@immutable
sealed class FileState {}

final class FileInitial extends FileState {}

final class FilesLoaded extends FileState {
  final List<CroppedFile>? files;

  FilesLoaded({required this.files});
}

final class FileError extends FileState {
  final ErrorResponse errorResponse;

  FileError({required this.errorResponse});
}

final class FilesAddedToPost extends FileState {}
