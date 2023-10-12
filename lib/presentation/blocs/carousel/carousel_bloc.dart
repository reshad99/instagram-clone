import 'package:bloc/bloc.dart';
import 'package:instagram_clone/data/home/model/post.dart';
import 'package:meta/meta.dart';

part 'carousel_event.dart';
part 'carousel_state.dart';

class CarouselBloc extends Bloc<CarouselEvent, List<CarouselState>> {
  CarouselBloc(int numberOfPosts)
      : super(List.generate(numberOfPosts, (_) => CarouselInitial())) {
    on<CarouselChanged>((event, emit) {
      final newState = List<CarouselState>.from(state);
      newState[event.postId] =
          CarouselUpdated(event.postId, event.currentIndex);
      emit(newState);
    });

    on<PostsUpdated>((event, emit) {
      final newState = List<CarouselState>.from(event.posts);
      emit(newState);
    });
  }
}
