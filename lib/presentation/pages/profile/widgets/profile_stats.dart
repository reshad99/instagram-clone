import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instagram_clone/core/helpers/style.dart';
import 'package:instagram_clone/data/auth/model/model.dart';
import 'package:instagram_clone/data/profile/bloc/bloc/follow_bloc.dart';
import 'package:instagram_clone/presentation/pages/home/widgets/profile_photo_widget.dart';
import 'package:instagram_clone/presentation/pages/profile/pages/user_list.dart';

class ProfileStats extends StatelessWidget {
  const ProfileStats({
    super.key,
    required this.user,
    required this.isMe,
  });
  final UserModel user;
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    final followBloc = context.read<FollowBloc>();
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 15.w,
        ),
        ProfilePhotoWidget(
          isMe: isMe,
          radius: 100,
          photo: user.image,
        ),
        SizedBox(
          width: 30.w,
        ),
        Column(
          children: [
            Text(
              user.postCount.toString(),
              style: AppStyles.profileStats,
            ),
            const Text(
              'Posts',
              style: AppStyles.profileStatsText,
            )
          ],
        ),
        SizedBox(
          width: 20.w,
        ),
        showFollowersButton(followBloc, context),
        SizedBox(
          width: 20.w,
        ),
        showFollowingButton(followBloc, context),
      ],
    );
  }

  GestureDetector showFollowingButton(
      FollowBloc followBloc, BuildContext context) {
    return GestureDetector(
      onTap: () {
        followBloc.add(ShowFollows(userId: user.id!));
        _showList(context);
      },
      child: Column(
        children: [
          Text(
            user.followCount.toString(),
            style: AppStyles.profileStats,
          ),
          const Text(
            'Following',
            style: AppStyles.profileStatsText,
          )
        ],
      ),
    );
  }

  GestureDetector showFollowersButton(
      FollowBloc followBloc, BuildContext context) {
    return GestureDetector(
      onTap: () {
        followBloc.add(ShowFollowers(userId: user.id!));
        _showList(context);
      },
      child: Column(
        children: [
          Text(
            user.followerCount.toString(),
            style: AppStyles.profileStats,
          ),
          const Text(
            'Followers',
            style: AppStyles.profileStatsText,
          )
        ],
      ),
    );
  }

  buildFollows() {}

  _showList(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return BlocBuilder<FollowBloc, FollowState>(
          builder: (context, state) {
            List<UserModel> users = [];
            debugPrint('state is $state');

            if (state is FollowLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (state is FollowersLoaded) {
              users = state.showFollowersResponse.data!;
            } else if (state is FollowsLoaded) {
              users = state.showFollowsResponse.data!;
            }

            return UserList(users: users);
          },
        );
      },
    );
  }
}
