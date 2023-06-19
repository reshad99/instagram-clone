import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'carousel_event.dart';
part 'carousel_state.dart';

class CarouselBloc extends Bloc<CarouselEvent, CarouselState> {
  CarouselBloc() : super(CarouselInitial()) {
    on<CarouselChanged>((event, emit) {
      emit(CarouselUpdated(event.currentIndex));
    });
  }
}
