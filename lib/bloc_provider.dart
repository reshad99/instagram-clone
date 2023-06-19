import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram_clone/presentation/global_screens/my_app.dart';

import 'presentation/blocs/carousel/carousel_bloc.dart';
import 'presentation/pages/home/home_screen.dart';

class BlocProviderInit {
  MultiBlocProvider init() {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CarouselBloc(),
          child: const HomeScreen(),
        )
      ],
      child: const MyApp(),
    );
    ;
  }
}
