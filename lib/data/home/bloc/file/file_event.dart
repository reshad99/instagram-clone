part of 'file_bloc.dart';

@immutable
sealed class FileEvent {}

final class AddFiles extends FileEvent {
  final List<CroppedFile>? files;

  AddFiles({required this.files});
}

final class FilesAdded extends FileEvent {}
