part of 'carousel_bloc.dart';

@immutable
abstract class CarouselState {}

class CarouselInitial extends CarouselState {}

class CarouselUpdated extends CarouselState {
  final int postId; // Add a postId to identify the post.
  final int currentIndex;
  int get getCurrentIndex => currentIndex;

  CarouselUpdated(this.postId, this.currentIndex);
}
