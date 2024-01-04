import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram_clone/data/auth/bloc/auth/auth_bloc.dart';
import 'package:instagram_clone/data/auth/bloc/login/login_bloc.dart';
import 'package:instagram_clone/data/auth/bloc/register/register_bloc.dart';
import 'package:instagram_clone/data/home/bloc/comment/comment_bloc.dart';
import 'package:instagram_clone/data/home/bloc/file/file_bloc.dart';
import 'package:instagram_clone/data/home/bloc/post/post_bloc.dart';
import 'package:instagram_clone/data/home/bloc/status/status_bloc.dart';
import 'package:instagram_clone/data/message/bloc/message/message_bloc.dart';
import 'package:instagram_clone/data/message/bloc/room/room_bloc.dart';
import 'package:instagram_clone/data/profile/bloc/bloc/follow_bloc.dart';
import 'package:instagram_clone/data/profile/bloc/profile/profile_bloc.dart';
import 'package:instagram_clone/data/search/bloc/explore/explore_bloc.dart';
import 'package:instagram_clone/data/search/bloc/search/search_bloc.dart';
import 'package:instagram_clone/presentation/global_screens/my_app.dart';
import 'package:instagram_clone/services/local_database/local_database.dart';
import 'package:instagram_clone/services/locator.dart';
import 'package:instagram_clone/services/socket/websocket.dart';

import 'presentation/blocs/carousel/carousel_bloc.dart';

class BlocProviderInit {
  MultiBlocProvider init() {
    final authBloc = AuthBloc();
    final fileBloc = FileBloc();
    final carouselBloc = CarouselBloc();
    final postBloc = PostBloc(carouselBloc, fileBloc);
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => authBloc..add(AppStarted()),
        ),
        BlocProvider(
          create: (context) => carouselBloc,
        ),
        BlocProvider(
          create: (context) => postBloc,
        ),
        BlocProvider(
          create: (context) => StatusBloc(),
        ),
        BlocProvider(
          create: (context) => FollowBloc(),
        ),
        BlocProvider(
          create: (context) => RoomBloc(),
        ),
        BlocProvider(
          create: (context) => MessageBloc(),
        ),
        BlocProvider(
          create: (context) => CommentBloc(),
        ),
        BlocProvider(
          create: (context) => ExploreBloc(),
        ),
        BlocProvider(
          create: (context) => SearchBloc(),
        ),
        BlocProvider(
          create: (context) => fileBloc,
        ),
        BlocProvider(
          create: (context) => ProfileBloc(),
        ),
        BlocProvider(
          create: (context) => LoginBloc(authBloc),
        ),
        BlocProvider(
          create: (context) => RegisterBloc(authBloc),
        ),
      ],
      child: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          debugPrint('bloc listener state is $state');

          if (state is AuthAuthenticated) {
            debugPrint('bloc listener auth state');
            context.read<PostBloc>().add(FetchPosts());
            context.read<StatusBloc>().add(FetchStatusesEvent());
            context.read<ProfileBloc>().add(ShowMyPosts());
            context.read<ExploreBloc>().add(FetchLatestPosts());
            locator.registerSingleton<WebSocketService>(WebSocketService(
                "wss://instagram.bakudevs.com/ws",
                locator<LocalDatabase>().get("token")));
          }
        },
        child: const MyApp(),
      ),
    );
  }
}
