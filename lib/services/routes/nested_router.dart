import 'package:auto_route/auto_route.dart';
import 'package:instagram_clone/services/routes/nested_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class NestedRouter extends $NestedRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: IntroRoute.page),
        AutoRoute(
          page: LoginRoute.page,
        ),
        AutoRoute(path: '/', page: RouterPage.page, children: [
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
          CustomRoute(page: ProfileRoute.page)
        ]),
      ];
}
