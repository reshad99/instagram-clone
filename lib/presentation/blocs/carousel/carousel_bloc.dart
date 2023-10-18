import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/presentation/models/carousel.dart';
import 'package:meta/meta.dart';

part 'carousel_event.dart';
part 'carousel_state.dart';

class CarouselBloc extends Bloc<CarouselEvent, CarouselState> {
  CarouselBloc() : super(CarouselInitial()) {
    on<CarouselChanged>((event, emit) {
      Carousel carousel = Carousel(
          postId: event.carousel.postId, currentIndex: event.currentIndex);
      emit(CarouselUpdated(carousel));
    });

  }
}
