import 'package:bloc/bloc.dart';
import 'package:instagram_clone/data/home/model/post.dart';
import 'package:instagram_clone/data/search/repository/explore_repository.dart';
import 'package:instagram_clone/data/search/response/latest_posts_response.dart';
import 'package:instagram_clone/data/search/service/explore_service.dart';
import 'package:instagram_clone/services/response/error_response.dart';
import 'package:meta/meta.dart';

part 'explore_event.dart';
part 'explore_state.dart';

class ExploreBloc extends Bloc<ExploreEvent, ExploreState> {
  final ExploreService exploreService =
      ExploreService(exploreRepository: ExploreRepository());
  ExploreBloc() : super(ExploreInitial()) {
    on<FetchLatestPosts>((event, emit) async {
      try {
        emit(LatestPostsLoading());
        final result = await exploreService.latestPosts();
        if (result is LatestPostsResponse) {
          emit(LatestPostsLoaded(posts: result.data!));
        } else if (result is ErrorResponse) {
          emit(LatestPostsError(errorResponse: result));
        }
      } catch (e) {
        emit(LatestPostsError(
            errorResponse: ErrorResponse(message: e.toString())));
      }
    });
    
  }
}
