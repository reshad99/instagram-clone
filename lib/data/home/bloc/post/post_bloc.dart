import 'package:bloc/bloc.dart';
import 'package:instagram_clone/data/home/model/post.dart';
import 'package:instagram_clone/data/home/repository/post_repository.dart';
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
  PostBloc(this.carouselBloc) : super(PostInitial()) {
    on<FetchPosts>((event, emit) async {
      emit(PostLoading());
      try {
        final result = await postService.getPosts();

        if (result is PostResponse) {
          emit(PostLoaded(posts: result.data!));
          carouselBloc.add(PostsUpdated(posts: result.data!));
        } else if (result is ErrorResponse) {
          emit(PostError(errorResponse: result));
        }
      } catch (e) {
        emit(PostError(errorResponse: ErrorResponse(message: e.toString())));
      }
    });
  }
}
