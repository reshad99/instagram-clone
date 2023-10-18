import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram_clone/data/auth/bloc/auth/auth_bloc.dart';
import 'package:instagram_clone/data/auth/bloc/login/login_bloc.dart';
import 'package:instagram_clone/data/auth/bloc/register/register_bloc.dart';
import 'package:instagram_clone/data/home/bloc/comment/comment_bloc.dart';
import 'package:instagram_clone/data/home/bloc/file/file_bloc.dart';
import 'package:instagram_clone/data/home/bloc/post/post_bloc.dart';
import 'package:instagram_clone/presentation/global_screens/my_app.dart';

import 'presentation/blocs/carousel/carousel_bloc.dart';

class BlocProviderInit {
  MultiBlocProvider init() {
    final authBloc = AuthBloc();
    final fileBloc = FileBloc();
    final carouselBloc = CarouselBloc();
    final postBloc = PostBloc(carouselBloc, fileBloc)..add(FetchPosts());
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => carouselBloc,
        ),
        BlocProvider(
          create: (context) => postBloc,
        ),
        BlocProvider(
          create: (context) => CommentBloc(),
        ),
        BlocProvider(
          create: (context) => fileBloc,
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
