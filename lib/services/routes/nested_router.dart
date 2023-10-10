import 'package:auto_route/auto_route.dart';
import 'package:instagram_clone/data/auth/bloc/auth/auth_bloc.dart';
import 'package:instagram_clone/services/routes/nested_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class NestedRouter extends $NestedRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();
  final authBloc = AuthBloc();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: IntroRoute.page),
        AutoRoute(
            path: '/',
            page: LoginRouter.page,
            keepHistory: false,
            children: [
              AutoRoute(path: 'login', page: LoginRoute.page, initial: true),
              AutoRoute(path: 'register', page: RegisterRoute.page),
            ]),
        AutoRoute(page: RouterPage.page, children: [
          AutoRoute(
            path: 'home',
            page: HomeRouter.page,
            children: [
              AutoRoute(
                path: '',
                page: HomeRoute.page,
              ),
              AutoRoute(page: DMRoute.page, path: 'dm')
            ],
          ),
          CustomRoute(page: SearchRoute.page),
          CustomRoute(page: AddPostRoute.page),
          CustomRoute(page: HeartRoute.page),
          AutoRoute(path: 'profile', page: ProfileRouter.page, children: [
            AutoRoute(page: ProfileRoute.page, path: ''),
            AutoRoute(
              page: EditProfileRoute.page,
              path: 'edit-profile',
            )
          ])
        ]),
      ];
}
