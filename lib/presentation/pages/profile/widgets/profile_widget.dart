import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instagram_clone/core/constants/colors.dart';
import 'package:instagram_clone/data/auth/model/model.dart';
import 'package:instagram_clone/data/home/model/post.dart';
import 'package:instagram_clone/presentation/global_widgets/custom_drawer.dart';
import 'package:instagram_clone/presentation/global_widgets/grey_line.dart';
import 'package:instagram_clone/presentation/pages/profile/widgets/edit_profile_button.dart';
import 'package:instagram_clone/presentation/pages/profile/widgets/follow_button.dart';
import 'package:instagram_clone/presentation/pages/profile/widgets/navbar.dart';
import 'package:instagram_clone/presentation/pages/profile/widgets/profile_stats.dart';
import 'package:instagram_clone/presentation/pages/profile/widgets/user_info.dart';

class ProfileWidget extends StatefulWidget {
  const ProfileWidget({
    super.key,
    required this.user,
    required this.tabController,
    required this.posts,
    required this.isMe,
  });

  final UserModel user;
  final TabController tabController;
  final List<Post> posts;
  final bool isMe;

  @override
  State<ProfileWidget> createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  @override
  Widget build(BuildContext context) {
    return CustomDrawer(
      scaffoldBody: CustomScrollView(
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildListDelegate(
              [
                ProfileStats(
                  isMe: widget.isMe,
                  user: widget.user,
                ),
                SizedBox(
                  height: 10.w,
                ),
                UserInfo(
                  user: widget.user,
                ),
                widget.isMe
                    ? const EditProfileButton()
                    : FollowButton(followed: widget.user.followed!),
                // const Highlights(),
                SizedBox(
                  height: 10.h,
                ),
                const GreyLine(
                  sizeRate: 1,
                  customColor: primaryGreyColor,
                ),
                TabBar(
                  indicatorColor: primaryGreyColor,
                  controller: widget.tabController,
                  tabs: const [
                    Tab(
                      child: Icon(
                        Icons.grid_on,
                        color: Colors.black54,
                        size: 30,
                      ),
                    ),
                    Tab(
                      child: Icon(
                        Icons.tag,
                        color: Colors.black54,
                        size: 30,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          buildList(),
        ],
      ),
      navBar: const NavBar(),
    );
  }

  Widget buildList() {
    if (widget.posts.isEmpty) {
      return SliverToBoxAdapter(
        child: SizedBox(
          child: Padding(
            padding: EdgeInsets.only(top: 150.h),
            child: const Center(
              child: Text('No post'),
            ),
          ),
        ),
      );
    }
    return SliverGrid(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, crossAxisSpacing: 1, mainAxisSpacing: 1),
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return SizedBox(
            width: 100,
            height: 100,
            child: Image.network(widget.posts[index].media![0].path!),
          );
        },
        childCount: widget.posts.length,
      ),
    );
  }
}
