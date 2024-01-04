import 'package:bloc/bloc.dart';
import 'package:instagram_clone/data/profile/repository/profile_repository.dart';
import 'package:instagram_clone/data/profile/response/show_followers_response.dart';
import 'package:instagram_clone/data/profile/response/show_follows_response.dart';
import 'package:instagram_clone/data/profile/service/profile_service.dart';
import 'package:instagram_clone/services/response/error_response.dart';
import 'package:meta/meta.dart';

part 'follow_event.dart';
part 'follow_state.dart';

class FollowBloc extends Bloc<FollowEvent, FollowState> {
  final profileService = ProfileService(profileRepository: ProfileRepository());
  FollowBloc() : super(FollowInitial()) {
    on<ShowFollowers>((event, emit) async {
      try {
        emit(FollowLoading());
        final result = await profileService.showFollowers(event.userId);
        if (result is ShowFollowersResponse) {
          emit(FollowersLoaded(showFollowersResponse: result));
        } else if (result is ErrorResponse) {
          emit(FollowError(errorResponse: result));
        }
      } catch (e) {
        emit(FollowError(errorResponse: ErrorResponse(message: e.toString())));
      }
    });

    on<ShowFollows>((event, emit) async {
      try {
        emit(FollowLoading());
        final result = await profileService.showFollows(event.userId);
        if (result is ShowFollowsResponse) {
          emit(FollowsLoaded(showFollowsResponse: result));
        } else if (result is ErrorResponse) {
          emit(FollowError(errorResponse: result));
        }
      } catch (e) {
        emit(FollowError(errorResponse: ErrorResponse(message: e.toString())));
      }
    });
  }
}
