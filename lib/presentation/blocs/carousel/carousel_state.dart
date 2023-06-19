part of 'carousel_bloc.dart';

@immutable
abstract class CarouselState {}

class CarouselInitial extends CarouselState {}

class CarouselUpdated extends CarouselState {
  final int currentIndex;

  CarouselUpdated(this.currentIndex);
}
