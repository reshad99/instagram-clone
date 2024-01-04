import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram_clone/data/auth/model/model.dart';
import 'package:instagram_clone/data/home/model/post.dart';
import 'package:instagram_clone/data/profile/bloc/profile/profile_bloc.dart';
import 'package:instagram_clone/presentation/global_screens/loading.dart';
import 'package:instagram_clone/presentation/pages/profile/widgets/profile_widget.dart';
import 'package:instagram_clone/services/local_database/local_database.dart';
import 'package:instagram_clone/services/locator.dart';
import 'package:instagram_clone/services/response/error_handler.dart';

@RoutePage(name: 'ProfileRouter')
class ProfileRouterScreen extends AutoRouter {
  const ProfileRouterScreen({super.key});
}

@RoutePage()
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key, required this.isMe});
  final bool isMe;

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with TickerProviderStateMixin {
  late TabController tabController;
  late LocalDatabase localDB;

  @override
  void initState() {
    super.initState();
    localDB = locator<LocalDatabase>();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    UserModel user = localDB.get('user');
    List<Post>? posts = localDB.get('my-posts');
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        debugPrint('state is $state');

        if (state is MyProfilePostsLoading || state is ProfileLoading) {
          return const LoadingScreen();
        }

        if (state is MyProfilePostsLoaded) {
          posts = state.posts;
        }

        if (state is MyProfileError) {
          ErrorHandler.showError(context, state.errorResponse);
        }

        if (state is MyProfileLoaded) {
          user = state.userModel;
          debugPrint('state is ProfileLoaded and user is: ${jsonEncode(user)}');
        }

        return RefreshIndicator(
          onRefresh: () async {
            context.read<ProfileBloc>().add(ShowMyPosts());
            context.read<ProfileBloc>().add(ShowProfile(userId: user.id!));
          },
          child: ProfileWidget(
              isMe: true,
              user: user,
              tabController: tabController,
              posts: posts!),
        );
      },
    );
  }
}
