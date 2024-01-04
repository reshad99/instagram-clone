import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/data/auth/model/model.dart';
import 'package:instagram_clone/data/home/model/post.dart';
import 'package:instagram_clone/data/profile/repository/profile_repository.dart';
import 'package:instagram_clone/data/profile/response/my_posts_response.dart';
import 'package:instagram_clone/data/profile/response/show_posts_response.dart';
import 'package:instagram_clone/data/profile/response/show_profile_response.dart';
import 'package:instagram_clone/data/profile/service/profile_service.dart';
import 'package:instagram_clone/services/local_database/local_database.dart';
import 'package:instagram_clone/services/locator.dart';
import 'package:instagram_clone/services/response/error_response.dart';
import 'package:meta/meta.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final profileService = ProfileService(profileRepository: ProfileRepository());
  ProfileBloc() : super(ProfileInitial()) {
    on<ShowProfile>((event, emit) async {
      try {
        emit(ProfileLoading());
        final result = await profileService.showProfile(event.userId);
        if (result is ShowProfileResponse) {
          debugPrint('result is ShowProfileResponse');
          final localDB = locator<LocalDatabase>();
          localDB.update('user', result.data);
          emit(ProfileLoaded(userModel: result.data!));
        } else if (result is ErrorResponse) {
          emit(ProfileError(errorResponse: result));
        }
      } catch (e) {
        emit(ProfileError(errorResponse: ErrorResponse(message: e.toString())));
      }
    });

    on<ShowMyPosts>((event, emit) async {
      try {
        emit(MyProfilePostsLoading());
        final result = await profileService.myPosts();
        if (result is MyPostsResponse) {
          final localDB = locator<LocalDatabase>();
          localDB.store('my-posts', result.data);
          emit(MyProfilePostsLoaded(posts: result.data!));
        } else if (result is ErrorResponse) {
          emit(MyProfileError(errorResponse: result));
        }
      } catch (e) {
        emit(MyProfileError(errorResponse: ErrorResponse(message: e.toString())));
      }
    });

    on<ShowProfilePosts>((event, emit) async {
      try {
        emit(ProfilePostsLoading());
        final result = await profileService.showPosts(event.userId);
        if (result is ShowPostsResponse) {
          emit(ProfilePostsLoaded(posts: result.data!));
        } else if (result is ErrorResponse) {
          emit(ProfileError(errorResponse: result));
        }
      } catch (e) {
        emit(ProfileError(errorResponse: ErrorResponse(message: e.toString())));
      }
    });
  }
}
