// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i10;
import 'package:instagram_clone/presentation/pages/add/add_post_screen.dart'
    as _i1;
import 'package:instagram_clone/presentation/pages/auth/intro_screen.dart'
    as _i2;
import 'package:instagram_clone/presentation/pages/auth/login_screen.dart'
    as _i3;
import 'package:instagram_clone/presentation/pages/home/home_screen.dart'
    as _i4;
import 'package:instagram_clone/presentation/pages/home/pages/dm.dart' as _i5;
import 'package:instagram_clone/presentation/pages/notifications/notifications.dart'
    as _i6;
import 'package:instagram_clone/presentation/pages/profile/profile_screen.dart'
    as _i7;
import 'package:instagram_clone/presentation/pages/search/search_screen.dart'
    as _i8;
import 'package:instagram_clone/services/routes/router_page.dart' as _i9;

abstract class $NestedRouter extends _i10.RootStackRouter {
  $NestedRouter({super.navigatorKey});

  @override
  final Map<String, _i10.PageFactory> pagesMap = {
    AddPostRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AddPostScreen(),
      );
    },
    IntroRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.IntroScreen(),
      );
    },
    LoginRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.LoginScreen(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.HomeScreen(),
      );
    },
    DMRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.DMScreen(),
      );
    },
    HeartRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.HeartScreen(),
      );
    },
    ProfileRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.ProfileScreen(),
      );
    },
    SearchRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.SearchScreen(),
      );
    },
    RouterPage.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.RouterPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.AddPostScreen]
class AddPostRoute extends _i10.PageRouteInfo<void> {
  const AddPostRoute({List<_i10.PageRouteInfo>? children})
      : super(
          AddPostRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddPostRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i2.IntroScreen]
class IntroRoute extends _i10.PageRouteInfo<void> {
  const IntroRoute({List<_i10.PageRouteInfo>? children})
      : super(
          IntroRoute.name,
          initialChildren: children,
        );

  static const String name = 'IntroRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i3.LoginScreen]
class LoginRoute extends _i10.PageRouteInfo<void> {
  const LoginRoute({List<_i10.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i4.HomeScreen]
class HomeRoute extends _i10.PageRouteInfo<void> {
  const HomeRoute({List<_i10.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i5.DMScreen]
class DMRoute extends _i10.PageRouteInfo<void> {
  const DMRoute({List<_i10.PageRouteInfo>? children})
      : super(
          DMRoute.name,
          initialChildren: children,
        );

  static const String name = 'DMRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i6.HeartScreen]
class HeartRoute extends _i10.PageRouteInfo<void> {
  const HeartRoute({List<_i10.PageRouteInfo>? children})
      : super(
          HeartRoute.name,
          initialChildren: children,
        );

  static const String name = 'HeartRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i7.ProfileScreen]
class ProfileRoute extends _i10.PageRouteInfo<void> {
  const ProfileRoute({List<_i10.PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i8.SearchScreen]
class SearchRoute extends _i10.PageRouteInfo<void> {
  const SearchRoute({List<_i10.PageRouteInfo>? children})
      : super(
          SearchRoute.name,
          initialChildren: children,
        );

  static const String name = 'SearchRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i9.RouterPage]
class RouterPage extends _i10.PageRouteInfo<void> {
  const RouterPage({List<_i10.PageRouteInfo>? children})
      : super(
          RouterPage.name,
          initialChildren: children,
        );

  static const String name = 'RouterPage';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}
