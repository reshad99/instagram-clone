import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instagram_clone/core/constants/colors.dart';
import 'package:instagram_clone/core/helpers/data.dart';
import 'package:instagram_clone/core/helpers/helpers.dart';
import 'package:instagram_clone/data/auth/bloc/auth/auth_bloc.dart';
import 'package:instagram_clone/data/home/bloc/post/post_bloc.dart';
import 'package:instagram_clone/data/home/model/post.dart';
import 'package:instagram_clone/presentation/global_screens/loading.dart';
import 'package:instagram_clone/presentation/pages/home/widgets/post_widget.dart';
import 'package:instagram_clone/presentation/pages/home/widgets/story_widget.dart';
import 'package:instagram_clone/services/response/error_handler.dart';
import 'package:instagram_clone/services/routes/nested_router.gr.dart';

import '../../global_widgets/grey_line.dart';

@RoutePage(name: 'HomeRouter')
class HomeRouterScreen extends AutoRouter {
  const HomeRouterScreen({super.key});
}

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authBloc = context.read<AuthBloc>();
    final postBloc = context.read<PostBloc>();
    return SafeArea(
      child: Scaffold(
        appBar: appBar(context, authBloc),
        body: RefreshIndicator(
          onRefresh: () async {
            postBloc.add(FetchPosts());
          },
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            SizedBox(
              height: 10.h,
            ),
            stories(),
            SizedBox(
              height: 10.h,
            ),
            const GreyLine(sizeRate: 1),
            Expanded(
              child: BlocBuilder<PostBloc, PostState>(
                bloc: postBloc,
                builder: (context, state) {
                  if (state is PostLoading) {
                    return const LoadingScreen();
                  }

                  if (state is PostError) {
                    ErrorHandler.showError(context, state.errorResponse);
                    return const Center(
                      child: Text('Error occurred'),
                    );
                  }

                  if (state is PostLoaded) {
                    return ListView.builder(
                      itemBuilder: (context, index) {
                        Post post = state.posts[index];
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 15),
                          child: PostWidget(
                            post: post,
                          ),
                        );
                      },
                      itemCount: state.posts.length,
                    );
                  }

                  return const LoadingScreen();
                },
              ),
            )
          ]),
        ),
      ),
    );
  }

  SizedBox stories() {
    return SizedBox(
      height: 110.h,
      child: ListView.builder(
        itemCount: storyData.length,
        itemBuilder: (context, index) {
          var story = storyData[index];
          return Padding(
              padding: const EdgeInsets.only(left: 7),
              child: StoryWidget(
                radius: 60.w,
                photo: story['photo'],
                text: 'joshua_l',
              ));
        },
        scrollDirection: Axis.horizontal,
      ),
    );
  }

  AppBar appBar(BuildContext context, AuthBloc authBloc) {
    return AppBar(
      bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(
            color: primaryGreyColor,
            width: double.infinity,
            height: 1,
          )),
      leading: IconButton(
          onPressed: () {}, icon: Image.asset(iconsPath('camera-icon.png'))),
      title: Image.asset(photosPath('logo-dark-little.png'), width: 150),
      actions: [
        IconButton(onPressed: () {}, icon: Image.asset(iconsPath('igtv.png'))),
        IconButton(
          onPressed: () {
            // authBloc.add(LoggedOut());
            // context.router.replaceAll([const DMRoute()]);
            // AutoRouter.of(context).push(const DMRoute());
            // context.replaceRoute(const LoginRoute());
            context.router.navigate(const DMRoute());
          },
          icon: Image.asset(iconsPath('dm.png')),
        ),
      ],
    );
  }
}
