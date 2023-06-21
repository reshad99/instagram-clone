import 'package:auto_route/auto_route.dart';
import 'package:instagram_clone/presentation/pages/auth/intro_screen.dart';
import 'package:instagram_clone/presentation/pages/auth/login_screen.dart';
import 'package:instagram_clone/presentation/pages/home/home_screen.dart';
import 'package:instagram_clone/services/routes/nested_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class NestedRouter extends $NestedRouter {
  @override
  RouteType get defaultRouteType => RouteType.adaptive();

  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: IntroRoute.page)
  ];
}
