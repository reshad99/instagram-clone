part of 'carousel_bloc.dart';

@immutable
abstract class CarouselEvent {}

class CarouselChanged extends CarouselEvent {
  final int currentIndex;

  CarouselChanged(this.currentIndex);
}
