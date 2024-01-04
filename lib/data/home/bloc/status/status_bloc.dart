import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/data/home/model/status.dart';
import 'package:instagram_clone/data/home/model/story.dart';
import 'package:instagram_clone/data/home/repository/status_repository.dart';
import 'package:instagram_clone/data/home/request/add_story_request.dart';
import 'package:instagram_clone/data/home/response/add_story_response.dart';
import 'package:instagram_clone/data/home/response/get_statuses_response.dart';
import 'package:instagram_clone/data/home/service/status_service.dart';
import 'package:instagram_clone/services/response/error_response.dart';
import 'package:meta/meta.dart';

part 'status_event.dart';
part 'status_state.dart';

class StatusBloc extends Bloc<StatusEvent, StatusState> {
  final StatusService statusService =
      StatusService(statusRepository: StatusRepository());
  StatusBloc() : super(StatusInitial()) {
    on<FetchStatusesEvent>((event, emit) async {
      try {
        emit(StatusLoading());
        final result = await statusService.fetchStatuses();
        if (result is GetStatusesResponse) {
          emit(StatusLoaded(statuses: result.data));
        } else if (result is ErrorResponse) {
          emit(StatusError(errorResponse: result));
        }
      } catch (e) {
        debugPrint('error is $e');
        emit(StatusError(errorResponse: ErrorResponse(message: e.toString())));
      }
    });

    on<AddStoryEvent>((event, emit) async {
      try {
        final result = await statusService.addStory(event.addStoryRequest);
        final currentState = state;
        if (result is AddStoryResponse && currentState is StatusLoaded) {
          Story newStory = result.data;

          int statusIndex = currentState.statuses!
              .indexWhere((status) => status.id == newStory.statusId);
          if (statusIndex != -1) {
            Status currentStatus = currentState.statuses![statusIndex];

            List<Story> updatedStories =
                List<Story>.from(currentState.statuses![statusIndex].stories!);
            updatedStories.add(newStory);

            Status newStatus = currentStatus.copyWith(stories: updatedStories);

            List<Status> updatedStatuses =
                List<Status>.from(currentState.statuses!)
                  ..[statusIndex] = newStatus;
            emit(StatusLoaded(statuses: updatedStatuses));
          }
        } else if (result is ErrorResponse) {
          emit(StatusError(errorResponse: result));
        }
      } catch (e) {
        emit(StatusError(errorResponse: ErrorResponse(message: e.toString())));
      }
    });
  }
}
