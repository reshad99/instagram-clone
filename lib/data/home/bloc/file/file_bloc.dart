import 'package:bloc/bloc.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:instagram_clone/services/response/error_response.dart';
import 'package:meta/meta.dart';

part 'file_event.dart';
part 'file_state.dart';

class FileBloc extends Bloc<FileEvent, FileState> {
  FileBloc() : super(FileInitial()) {
    on<AddFiles>((event, emit) async {
      try {
        emit(FilesLoaded(files: event.files));
      } catch (e) {
        emit(FileError(errorResponse: ErrorResponse(message: e.toString())));
      }
    });

    on<FilesAdded>((event, emit) async {
      try {
        emit(FilesAddedToPost());
      } catch (e) {
        emit(FileError(errorResponse: ErrorResponse(message: e.toString())));
      }
    });
  }
}
