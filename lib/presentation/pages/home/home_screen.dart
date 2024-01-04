import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instagram_clone/core/constants/colors.dart';
import 'package:instagram_clone/core/helpers/helpers.dart';
import 'package:instagram_clone/data/auth/bloc/auth/auth_bloc.dart';
import 'package:instagram_clone/data/auth/model/model.dart';
import 'package:instagram_clone/data/home/bloc/post/post_bloc.dart';
import 'package:instagram_clone/data/home/bloc/status/status_bloc.dart';
import 'package:instagram_clone/data/home/model/post.dart';
import 'package:instagram_clone/data/home/model/status.dart';
import 'package:instagram_clone/data/message/bloc/room/room_bloc.dart';
import 'package:instagram_clone/presentation/models/carousel.dart';
import 'package:instagram_clone/presentation/pages/home/widgets/post_widget.dart';
import 'package:instagram_clone/presentation/pages/home/widgets/profile_photo_widget.dart';
import 'package:instagram_clone/presentation/pages/home/widgets/story_widget.dart';
import 'package:instagram_clone/services/local_database/local_database.dart';
import 'package:instagram_clone/services/locator.dart';
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
  @override
  Widget build(BuildContext context) {
    final authBloc = context.read<AuthBloc>();
    final postBloc = context.read<PostBloc>();
    final statusBloc = context.read<StatusBloc>();
    LocalDatabase localDB = locator<LocalDatabase>();

    return SafeArea(
      child: Scaffold(
        appBar: appBar(context, authBloc),
        body: RefreshIndicator(
          onRefresh: () async {
            postBloc.add(FetchPosts());
            statusBloc.add(FetchStatusesEvent());
          },
          child: buildPage(postBloc, localDB),
        ),
      ),
    );
  }

  BlocBuilder<PostBloc, PostState> buildPage(
      PostBloc postBloc, LocalDatabase localDB) {
    return BlocBuilder<PostBloc, PostState>(
      bloc: postBloc,
      builder: (context, postState) {
        return BlocBuilder<StatusBloc, StatusState>(
          builder: (context, statusState) {
            // If any of the states is loading, show a loading indicator
            if (postState is PostLoading || statusState is StatusLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (postState is PostLoaded && statusState is StatusLoaded) {
              // Otherwise, build the list
              return CustomScrollView(
                slivers: [
                  SliverList(
                    delegate: SliverChildListDelegate([
                      SizedBox(
                        height: 10.h,
                      ),
                      stories(statusState, localDB),
                      SizedBox(
                        height: 10.h,
                      ),
                      const GreyLine(sizeRate: 1),
                    ]),
                  ),
                  buildPosts(postState),
                ],
              );
            }

            if (postState is PostError) {
              ErrorHandler.showError(context, postState.errorResponse);
            }

            if (statusState is StatusError) {
              ErrorHandler.showError(context, statusState.errorResponse);
            }

            return const SizedBox();
          },
        );
      },
    );
  }

  Widget buildPosts(PostState postState) {
    if (postState is PostLoaded) {
      return SliverList.builder(
        itemBuilder: (context, index) {
          Post post = postState.posts[index];
          Carousel carousel = Carousel(postId: post.id!, currentIndex: 0);

          return Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: PostWidget(
              post: post,
              carousel: carousel,
            ),
          );
        },
        itemCount: postState.posts.length,
      );
    }

    return const SizedBox();
  }

  Widget stories(StatusState state, LocalDatabase localDB) {
    if (state is StatusLoaded) {
      if (state.statuses != null && state.statuses!.isNotEmpty) {
        return SizedBox(
          height: 110.h,
          child: ListView.builder(
            itemCount: state.statuses!.length,
            itemBuilder: (context, index) {
              Status status = state.statuses![index];
              return Padding(
                padding: const EdgeInsets.only(left: 7),
                child: StoryWidget(
                  radius: 60.w,
                  index: index,
                  statuses: state.statuses!,
                  photo: status.customer!.image,
                  text: status.customer!.username,
                ),
              );
            },
            scrollDirection: Axis.horizontal,
          ),
        );
      } else {
        return Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 7),
              child: ProfilePhotoWidget(
                isMe: true,
                radius: 60.w,
                photo: (localDB.get('user') as UserModel).image,
                text: (localDB.get('user') as UserModel).username,
              ),
            ),
          ],
        );
      }
    }

    // Removed the loading indicator since it will be shown by the main build method
    return const SizedBox();
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
          onPressed: () async {
            pickImageForStory(context);
          },
          icon: Image.asset(iconsPath('camera-icon.png'))),
      title: Image.asset(photosPath('logo-dark-little.png'), width: 150),
      actions: [
        IconButton(onPressed: () {}, icon: Image.asset(iconsPath('igtv.png'))),
        IconButton(
          onPressed: () {
            // authBloc.add(LoggedOut());
            // context.router.replaceAll([const DMRoute()]);
            // AutoRouter.of(context).push(const DMRoute());
            // context.replaceRoute(const LoginRoute());
            context.read<RoomBloc>().add(FetchRooms());
            context.router.navigate(const DMRoute());
          },
          icon: Image.asset(iconsPath('dm.png')),
        ),
      ],
    );
  }
}
