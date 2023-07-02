import 'package:auto_route/auto_route.dart';
import 'package:instagram_clone/services/routes/nested_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class NestedRouter extends $NestedRouter {
  @override
  RouteType get defaultRouteType => const RouteType.adaptive();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: IntroRoute.page),
        AutoRoute(
          page: LoginRoute.page,
        ),
        AutoRoute(initial: true, page: RouterPage.page, children: [
          CustomRoute(page: HomeRoute.page),
          CustomRoute(page: SearchRoute.page),
          CustomRoute(page: AddPostRoute.page),
          CustomRoute(page: HeartRoute.page),
          CustomRoute(initial: true, page: ProfileRoute.page)
        ])
      ];
}
