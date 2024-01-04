import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/data/home/bloc/file/file_bloc.dart';
import 'package:instagram_clone/data/home/model/post.dart';
import 'package:instagram_clone/data/home/repository/post_repository.dart';
import 'package:instagram_clone/data/home/request/post_request.dart';
import 'package:instagram_clone/data/home/response/add_post_response.dart';
import 'package:instagram_clone/data/home/response/post_response.dart';
import 'package:instagram_clone/data/home/service/post_service.dart';
import 'package:instagram_clone/presentation/blocs/carousel/carousel_bloc.dart';
import 'package:instagram_clone/services/response/error_response.dart';
import 'package:meta/meta.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final postService = PostService(postRepository: PostRepository());
  final CarouselBloc carouselBloc;
  final FileBloc fileBloc;
  PostBloc(this.carouselBloc, this.fileBloc) : super(PostInitial()) {
    on<FetchPosts>((event, emit) async {
      emit(PostLoading());
      try {
        final result = await postService.getPosts();

        if (result is PostResponse) {
          emit(PostLoaded(posts: result.data!));
        } else if (result is ErrorResponse) {
          emit(PostError(errorResponse: result));
        }
      } catch (e) {
        emit(PostError(errorResponse: ErrorResponse(message: e.toString())));
      }
    });

    on<LikePost>((event, emit) async {
      try {
        final List<Post> currentPosts = (state as PostLoaded).posts;
        final int index =
            currentPosts.indexWhere((post) => post.id == event.postId);
        final Post currentPost = currentPosts[index];
        final bool isLiked = currentPost.liked!;

        currentPost.liked = !isLiked;

        currentPost.likes =
            isLiked ? currentPost.likes! - 1 : currentPost.likes! + 1;

        emit(PostLoaded(posts: currentPosts));

        final result = await postService.likePost(event.postId);

        if (!result) {
          throw Exception('Error occurred');
        }
      } catch (e) {
        emit(PostError(errorResponse: ErrorResponse(message: e.toString())));
      }
    });

    on<AddPost>((event, emit) async {
      try {
        final result = await postService.addPost(event.postRequest);
        final currentState = state;

        if (result is AddPostResponse && currentState is PostLoaded) {
          final updatedState = List<Post>.from(currentState.posts)
            ..insert(0, result.data!);

          emit(PostLoaded(posts: updatedState));
          fileBloc.add(FilesAdded());
        } else if (result is ErrorResponse) {
          emit(PostError(errorResponse: result));
        }
      } catch (e) {
        emit(PostError(errorResponse: ErrorResponse(message: e.toString())));
      }
    });
  }
}
