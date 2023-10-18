import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/data/home/model/comment.dart';
import 'package:instagram_clone/data/home/repository/comment_repository.dart';
import 'package:instagram_clone/data/home/request/add_comment_request.dart';
import 'package:instagram_clone/data/home/response/add_comment_response.dart';
import 'package:instagram_clone/data/home/response/comment_response.dart';
import 'package:instagram_clone/data/home/service/comment_service.dart';
import 'package:instagram_clone/services/response/error_response.dart';
import 'package:meta/meta.dart';

part 'comment_event.dart';
part 'comment_state.dart';

class CommentBloc extends Bloc<CommentEvent, CommentState> {
  final CommentService commentService =
      CommentService(commentRepository: CommentRepository());
  CommentBloc() : super(CommentInitial()) {
    on<ShowComments>((event, emit) async {
      try {
        emit(CommentsLoading());
        final result = await commentService.showComments(event.postId);

        if (result is CommentResponse) {
          emit(CommentsLoaded(comments: result.data!));
        } else if (result is ErrorResponse) {
          emit(CommentsError(errorResponse: result));
        }
      } catch (e) {
        emit(
            CommentsError(errorResponse: ErrorResponse(message: e.toString())));
      }
    });

    on<AddComment>((event, emit) async {
      try {
        final result = await commentService.addComment(event.addCommentRequest);

        if (result is AddCommentResponse) {
          final currentState = state;

          if (currentState is CommentsLoaded) {
            debugPrint('state is commentsloaded');
            final updatedState = List<Comment>.from(currentState.comments)
              ..insert(0, result.data!);
            emit(CommentsLoaded(comments: updatedState));
          }
        } else if (result is ErrorResponse) {
          emit(CommentsError(errorResponse: result));
        }
      } catch (e) {
        emit(
            CommentsError(errorResponse: ErrorResponse(message: e.toString())));
      }
    });
  }
}
