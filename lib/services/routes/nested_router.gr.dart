// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i17;
import 'package:flutter/material.dart' as _i18;
import 'package:image_picker/image_picker.dart' as _i20;
import 'package:instagram_clone/data/auth/model/model.dart' as _i21;
import 'package:instagram_clone/data/home/model/status.dart' as _i19;
import 'package:instagram_clone/data/message/model/room.dart' as _i22;
import 'package:instagram_clone/presentation/pages/add/add_post_screen.dart'
    as _i1;
import 'package:instagram_clone/presentation/pages/add/add_story_screen.dart'
    as _i13;
import 'package:instagram_clone/presentation/pages/auth/intro_screen.dart'
    as _i2;
import 'package:instagram_clone/presentation/pages/auth/login_screen.dart'
    as _i3;
import 'package:instagram_clone/presentation/pages/auth/register_screen.dart'
    as _i4;
import 'package:instagram_clone/presentation/pages/home/home_screen.dart'
    as _i5;
import 'package:instagram_clone/presentation/pages/home/pages/create_room.dart'
    as _i16;
import 'package:instagram_clone/presentation/pages/home/pages/dm.dart' as _i6;
import 'package:instagram_clone/presentation/pages/home/pages/messages.dart'
    as _i15;
import 'package:instagram_clone/presentation/pages/home/widgets/story_view.dart'
    as _i7;
import 'package:instagram_clone/presentation/pages/notifications/notifications.dart'
    as _i8;
import 'package:instagram_clone/presentation/pages/profile/pages/edit_profile.dart'
    as _i9;
import 'package:instagram_clone/presentation/pages/profile/pages/user_profile.dart'
    as _i14;
import 'package:instagram_clone/presentation/pages/profile/profile_screen.dart'
    as _i10;
import 'package:instagram_clone/presentation/pages/search/search_screen.dart'
    as _i11;
import 'package:instagram_clone/services/routes/router_page.dart' as _i12;

abstract class $NestedRouter extends _i17.RootStackRouter {
  $NestedRouter({super.navigatorKey});

  @override
  final Map<String, _i17.PageFactory> pagesMap = {
    AddPostRoute.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AddPostScreen(),
      );
    },
    IntroRoute.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.IntroScreen(),
      );
    },
    LoginRouter.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.LoginRouterScreen(),
      );
    },
    LoginRoute.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.LoginScreen(),
      );
    },
    RegisterRoute.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.RegisterScreen(),
      );
    },
    HomeRouter.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.HomeRouterScreen(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.HomeScreen(),
      );
    },
    DMRoute.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.DMScreen(),
      );
    },
    StoryViewRoute.name: (routeData) {
      final args = routeData.argsAs<StoryViewRouteArgs>();
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i7.StoryViewScreen(
          key: args.key,
          statuses: args.statuses,
          index: args.index,
        ),
      );
    },
    HeartRouter.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i8.HeartRouterScreen(),
      );
    },
    HeartRoute.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.HeartScreen(),
      );
    },
    EditProfileRoute.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.EditProfileScreen(),
      );
    },
    ProfileRouter.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.ProfileRouterScreen(),
      );
    },
    ProfileRoute.name: (routeData) {
      final args = routeData.argsAs<ProfileRouteArgs>();
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i10.ProfileScreen(
          key: args.key,
          isMe: args.isMe,
        ),
      );
    },
    SearchRouter.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i11.SearchRouterScreen(),
      );
    },
    SearchRoute.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i11.SearchScreen(),
      );
    },
    RouterPage.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i12.RouterPage(),
      );
    },
    AddStoryRoute.name: (routeData) {
      final args = routeData.argsAs<AddStoryRouteArgs>();
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i13.AddStoryScreen(
          key: args.key,
          file: args.file,
        ),
      );
    },
    UserProfileRoute.name: (routeData) {
      final args = routeData.argsAs<UserProfileRouteArgs>();
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i14.UserProfileScreen(
          key: args.key,
          user: args.user,
        ),
      );
    },
    MessagesRoute.name: (routeData) {
      final args = routeData.argsAs<MessagesRouteArgs>();
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i15.MessagesScreen(
          key: args.key,
          room: args.room,
        ),
      );
    },
    CreateRoomRoute.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i16.CreateRoomScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.AddPostScreen]
class AddPostRoute extends _i17.PageRouteInfo<void> {
  const AddPostRoute({List<_i17.PageRouteInfo>? children})
      : super(
          AddPostRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddPostRoute';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i2.IntroScreen]
class IntroRoute extends _i17.PageRouteInfo<void> {
  const IntroRoute({List<_i17.PageRouteInfo>? children})
      : super(
          IntroRoute.name,
          initialChildren: children,
        );

  static const String name = 'IntroRoute';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i3.LoginRouterScreen]
class LoginRouter extends _i17.PageRouteInfo<void> {
  const LoginRouter({List<_i17.PageRouteInfo>? children})
      : super(
          LoginRouter.name,
          initialChildren: children,
        );

  static const String name = 'LoginRouter';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i3.LoginScreen]
class LoginRoute extends _i17.PageRouteInfo<void> {
  const LoginRoute({List<_i17.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i4.RegisterScreen]
class RegisterRoute extends _i17.PageRouteInfo<void> {
  const RegisterRoute({List<_i17.PageRouteInfo>? children})
      : super(
          RegisterRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegisterRoute';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i5.HomeRouterScreen]
class HomeRouter extends _i17.PageRouteInfo<void> {
  const HomeRouter({List<_i17.PageRouteInfo>? children})
      : super(
          HomeRouter.name,
          initialChildren: children,
        );

  static const String name = 'HomeRouter';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i5.HomeScreen]
class HomeRoute extends _i17.PageRouteInfo<void> {
  const HomeRoute({List<_i17.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i6.DMScreen]
class DMRoute extends _i17.PageRouteInfo<void> {
  const DMRoute({List<_i17.PageRouteInfo>? children})
      : super(
          DMRoute.name,
          initialChildren: children,
        );

  static const String name = 'DMRoute';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i7.StoryViewScreen]
class StoryViewRoute extends _i17.PageRouteInfo<StoryViewRouteArgs> {
  StoryViewRoute({
    _i18.Key? key,
    required List<_i19.Status> statuses,
    required int index,
    List<_i17.PageRouteInfo>? children,
  }) : super(
          StoryViewRoute.name,
          args: StoryViewRouteArgs(
            key: key,
            statuses: statuses,
            index: index,
          ),
          initialChildren: children,
        );

  static const String name = 'StoryViewRoute';

  static const _i17.PageInfo<StoryViewRouteArgs> page =
      _i17.PageInfo<StoryViewRouteArgs>(name);
}

class StoryViewRouteArgs {
  const StoryViewRouteArgs({
    this.key,
    required this.statuses,
    required this.index,
  });

  final _i18.Key? key;

  final List<_i19.Status> statuses;

  final int index;

  @override
  String toString() {
    return 'StoryViewRouteArgs{key: $key, statuses: $statuses, index: $index}';
  }
}

/// generated route for
/// [_i8.HeartRouterScreen]
class HeartRouter extends _i17.PageRouteInfo<void> {
  const HeartRouter({List<_i17.PageRouteInfo>? children})
      : super(
          HeartRouter.name,
          initialChildren: children,
        );

  static const String name = 'HeartRouter';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i8.HeartScreen]
class HeartRoute extends _i17.PageRouteInfo<void> {
  const HeartRoute({List<_i17.PageRouteInfo>? children})
      : super(
          HeartRoute.name,
          initialChildren: children,
        );

  static const String name = 'HeartRoute';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i9.EditProfileScreen]
class EditProfileRoute extends _i17.PageRouteInfo<void> {
  const EditProfileRoute({List<_i17.PageRouteInfo>? children})
      : super(
          EditProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'EditProfileRoute';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i10.ProfileRouterScreen]
class ProfileRouter extends _i17.PageRouteInfo<void> {
  const ProfileRouter({List<_i17.PageRouteInfo>? children})
      : super(
          ProfileRouter.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRouter';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i10.ProfileScreen]
class ProfileRoute extends _i17.PageRouteInfo<ProfileRouteArgs> {
  ProfileRoute({
    _i18.Key? key,
    required bool isMe,
    List<_i17.PageRouteInfo>? children,
  }) : super(
          ProfileRoute.name,
          args: ProfileRouteArgs(
            key: key,
            isMe: isMe,
          ),
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const _i17.PageInfo<ProfileRouteArgs> page =
      _i17.PageInfo<ProfileRouteArgs>(name);
}

class ProfileRouteArgs {
  const ProfileRouteArgs({
    this.key,
    required this.isMe,
  });

  final _i18.Key? key;

  final bool isMe;

  @override
  String toString() {
    return 'ProfileRouteArgs{key: $key, isMe: $isMe}';
  }
}

/// generated route for
/// [_i11.SearchRouterScreen]
class SearchRouter extends _i17.PageRouteInfo<void> {
  const SearchRouter({List<_i17.PageRouteInfo>? children})
      : super(
          SearchRouter.name,
          initialChildren: children,
        );

  static const String name = 'SearchRouter';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i11.SearchScreen]
class SearchRoute extends _i17.PageRouteInfo<void> {
  const SearchRoute({List<_i17.PageRouteInfo>? children})
      : super(
          SearchRoute.name,
          initialChildren: children,
        );

  static const String name = 'SearchRoute';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i12.RouterPage]
class RouterPage extends _i17.PageRouteInfo<void> {
  const RouterPage({List<_i17.PageRouteInfo>? children})
      : super(
          RouterPage.name,
          initialChildren: children,
        );

  static const String name = 'RouterPage';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i13.AddStoryScreen]
class AddStoryRoute extends _i17.PageRouteInfo<AddStoryRouteArgs> {
  AddStoryRoute({
    _i18.Key? key,
    required _i20.XFile file,
    List<_i17.PageRouteInfo>? children,
  }) : super(
          AddStoryRoute.name,
          args: AddStoryRouteArgs(
            key: key,
            file: file,
          ),
          initialChildren: children,
        );

  static const String name = 'AddStoryRoute';

  static const _i17.PageInfo<AddStoryRouteArgs> page =
      _i17.PageInfo<AddStoryRouteArgs>(name);
}

class AddStoryRouteArgs {
  const AddStoryRouteArgs({
    this.key,
    required this.file,
  });

  final _i18.Key? key;

  final _i20.XFile file;

  @override
  String toString() {
    return 'AddStoryRouteArgs{key: $key, file: $file}';
  }
}

/// generated route for
/// [_i14.UserProfileScreen]
class UserProfileRoute extends _i17.PageRouteInfo<UserProfileRouteArgs> {
  UserProfileRoute({
    _i18.Key? key,
    required _i21.UserModel user,
    List<_i17.PageRouteInfo>? children,
  }) : super(
          UserProfileRoute.name,
          args: UserProfileRouteArgs(
            key: key,
            user: user,
          ),
          initialChildren: children,
        );

  static const String name = 'UserProfileRoute';

  static const _i17.PageInfo<UserProfileRouteArgs> page =
      _i17.PageInfo<UserProfileRouteArgs>(name);
}

class UserProfileRouteArgs {
  const UserProfileRouteArgs({
    this.key,
    required this.user,
  });

  final _i18.Key? key;

  final _i21.UserModel user;

  @override
  String toString() {
    return 'UserProfileRouteArgs{key: $key, user: $user}';
  }
}

/// generated route for
/// [_i15.MessagesScreen]
class MessagesRoute extends _i17.PageRouteInfo<MessagesRouteArgs> {
  MessagesRoute({
    _i18.Key? key,
    required _i22.Room room,
    List<_i17.PageRouteInfo>? children,
  }) : super(
          MessagesRoute.name,
          args: MessagesRouteArgs(
            key: key,
            room: room,
          ),
          initialChildren: children,
        );

  static const String name = 'MessagesRoute';

  static const _i17.PageInfo<MessagesRouteArgs> page =
      _i17.PageInfo<MessagesRouteArgs>(name);
}

class MessagesRouteArgs {
  const MessagesRouteArgs({
    this.key,
    required this.room,
  });

  final _i18.Key? key;

  final _i22.Room room;

  @override
  String toString() {
    return 'MessagesRouteArgs{key: $key, room: $room}';
  }
}

/// generated route for
/// [_i16.CreateRoomScreen]
class CreateRoomRoute extends _i17.PageRouteInfo<void> {
  const CreateRoomRoute({List<_i17.PageRouteInfo>? children})
      : super(
          CreateRoomRoute.name,
          initialChildren: children,
        );

  static const String name = 'CreateRoomRoute';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}
