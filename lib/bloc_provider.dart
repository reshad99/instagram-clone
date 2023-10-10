import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram_clone/core/helpers/data.dart';
import 'package:instagram_clone/data/auth/bloc/auth/auth_bloc.dart';
import 'package:instagram_clone/data/auth/bloc/login/login_bloc.dart';
import 'package:instagram_clone/data/auth/bloc/register/register_bloc.dart';
import 'package:instagram_clone/presentation/global_screens/my_app.dart';

import 'presentation/blocs/carousel/carousel_bloc.dart';
import 'presentation/pages/home/home_screen.dart';

class BlocProviderInit {
  MultiBlocProvider init() {
    final authBloc = AuthBloc();
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CarouselBloc(postData.length),
          child: const HomeScreen(),
        ),
        BlocProvider(
          create: (context) => LoginBloc(authBloc),
        ),
        BlocProvider(
          create: (context) => RegisterBloc(authBloc),
        ),
        BlocProvider(
          create: (context) => authBloc..add(AppStarted()),
        ),
      ],
      child: const MyApp(),
    );
  }
}
