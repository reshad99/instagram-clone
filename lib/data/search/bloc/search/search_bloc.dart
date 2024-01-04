import 'package:bloc/bloc.dart';
import 'package:instagram_clone/data/auth/model/model.dart';
import 'package:instagram_clone/data/search/repository/explore_repository.dart';
import 'package:instagram_clone/data/search/response/search_response.dart';
import 'package:instagram_clone/data/search/service/explore_service.dart';
import 'package:instagram_clone/services/response/error_response.dart';
import 'package:meta/meta.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final exploreService = ExploreService(exploreRepository: ExploreRepository());
  SearchBloc() : super(SearchInitial()) {
    on<TrySearch>((event, emit) async {
      try {
        emit(SearchLoading());
        final result = await exploreService.search(event.query);
        if (result is SearchResponse) {
          emit(SearchLoaded(users: result.data!));
        } else if (result is ErrorResponse) {
          emit(SearchError(errorResponse: result));
        }
      } catch (e) {
        emit(SearchError(errorResponse: ErrorResponse(message: e.toString())));
      }
    });
  }
}
