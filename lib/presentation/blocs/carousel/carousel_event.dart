part of 'carousel_bloc.dart';

@immutable
abstract class CarouselEvent {}

class CarouselChanged extends CarouselEvent {
  final int postId; // Add a postId to identify the post.
  final int currentIndex;

  CarouselChanged(this.postId, this.currentIndex);
}

