part of 'carousel_bloc.dart';

@immutable
abstract class CarouselState {}

class CarouselInitial extends CarouselState {}

class CarouselUpdated extends CarouselState {
  final Carousel carousel; // Add a postId to identify the post.

  CarouselUpdated(this.carousel);
}
