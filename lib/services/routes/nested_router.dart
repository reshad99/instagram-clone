import 'package:auto_route/auto_route.dart';
import 'package:instagram_clone/data/auth/bloc/auth/auth_bloc.dart';
import 'package:instagram_clone/services/routes/guards/auth_guard.dart';
import 'package:instagram_clone/services/routes/nested_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class NestedRouter extends $NestedRouter {
  NestedRouter({super.navigatorKey, required this.authBloc});

  @override
  RouteType get defaultRouteType => const RouteType.material();
  final AuthBloc authBloc;

  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: IntroRoute.page),
        AutoRoute(page: LoginRouter.page, keepHistory: false, children: [
          AutoRoute(path: 'login', page: LoginRoute.page, initial: true),
          AutoRoute(path: 'register', page: RegisterRoute.page),
        ]),
        AutoRoute(page: StoryViewRoute.page, path: '/story-view'),
        AutoRoute(page: AddStoryRoute.page, path: '/add-story'),
        AutoRoute(
            path: '/',
            guards: [AuthGuard(authBloc: authBloc)],
            page: RouterPage.page,
            children: [
              AutoRoute(
                initial: true,
                path: 'home',
                page: HomeRouter.page,
                children: [
                  AutoRoute(
                    path: '',
                    page: HomeRoute.page,
                  ),
                  AutoRoute(page: DMRoute.page, path: 'dm'),
                  AutoRoute(page: MessagesRoute.page, path: 'messages'),
                  AutoRoute(page: CreateRoomRoute.page, path: 'create-room'),
                ],
              ),
              CustomRoute(page: SearchRoute.page),
              CustomRoute(page: AddPostRoute.page),
              CustomRoute(page: HeartRoute.page),
              AutoRoute(path: 'profile', page: ProfileRouter.page, children: [
                AutoRoute(
                    page: ProfileRoute.page,
                    path: '',
                    keepHistory: true,
                    maintainState: true),
                AutoRoute(
                    page: UserProfileRoute.page,
                    path: 'user-profile',
                    keepHistory: false,
                    maintainState: false),
                AutoRoute(
                  page: EditProfileRoute.page,
                  path: 'edit-profile',
                )
              ])
            ]),
      ];
}
