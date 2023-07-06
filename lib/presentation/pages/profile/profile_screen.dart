import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instagram_clone/core/constants/colors.dart';
import 'package:instagram_clone/core/helpers/helpers.dart';
import 'package:instagram_clone/presentation/global_widgets/custom_drawer.dart';
import 'package:instagram_clone/presentation/global_widgets/grey_line.dart';
import 'package:instagram_clone/presentation/pages/profile/widgets/edit_profile_button.dart';
import 'package:instagram_clone/presentation/pages/profile/widgets/highlights.dart';
import 'package:instagram_clone/presentation/pages/profile/widgets/navbar.dart';
import 'package:instagram_clone/presentation/pages/profile/widgets/profile_stats.dart';
import 'package:instagram_clone/presentation/pages/profile/widgets/user_info.dart';

@RoutePage(name: 'ProfileRouter')
class ProfileRouterScreen extends AutoRouter {}

@RoutePage()
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with TickerProviderStateMixin {
  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> posts = [
      {'photo': photosPath('profile_post.png')},
      {'photo': photosPath('profile_post.png')},
      {'photo': photosPath('profile_post.png')},
      {'photo': photosPath('profile_post.png')},
      {'photo': photosPath('profile_post.png')},
      {'photo': photosPath('profile_post.png')},
      {'photo': photosPath('profile_post.png')},
      {'photo': photosPath('profile_post.png')},
      {'photo': photosPath('profile_post.png')},
      {'photo': photosPath('profile_post.png')},
      {'photo': photosPath('profile_post.png')},
      {'photo': photosPath('profile_post.png')},
      {'photo': photosPath('profile_post.png')},
      {'photo': photosPath('profile_post.png')},
      {'photo': photosPath('profile_post.png')},
    ];
    return CustomDrawer(
      scaffoldBody: CustomScrollView(
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildListDelegate(
              [
                const ProfileStats(),
                SizedBox(
                  height: 10.w,
                ),
                const UserInfo(),
                const EditProfileButton(),
                const Highlights(),
                SizedBox(
                  height: 10.h,
                ),
                const GreyLine(
                  sizeRate: 1,
                  customColor: primaryGreyColor,
                ),
                TabBar(
                  indicatorColor: primaryGreyColor,
                  controller: tabController,
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
          SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, crossAxisSpacing: 1, mainAxisSpacing: 1),
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  width: 100,
                  height: 100,
                  child: Image.asset(posts[index]['photo']),
                );
              },
              childCount: posts.length,
            ),
          ),
        ],
      ),
      navBar: const NavBar(),
    );
  }
}
