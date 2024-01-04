import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram_clone/data/auth/model/model.dart';
import 'package:instagram_clone/data/home/model/post.dart';
import 'package:instagram_clone/data/profile/bloc/profile/profile_bloc.dart';
import 'package:instagram_clone/presentation/global_screens/loading.dart';
import 'package:instagram_clone/presentation/pages/profile/widgets/profile_widget.dart';
import 'package:instagram_clone/services/response/error_handler.dart';

@RoutePage()
class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key, required this.user});
  final UserModel user;

  @override
  State<UserProfileScreen> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfileScreen>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    List<Post> posts = [];
    context.read<ProfileBloc>().add(ShowProfilePosts(userId: widget.user.id!));
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        if (state is ProfilePostsLoading) {
          return const LoadingScreen();
        }

        if (state is ProfileError) {
          ErrorHandler.showError(context, state.errorResponse);
        }

        if (state is ProfilePostsLoaded) {
          posts = state.posts;
        }

        return ProfileWidget(
            user: widget.user,
            tabController: TabController(length: 2, vsync: this),
            posts: posts,
            isMe: false);
      },
    );
  }
}
