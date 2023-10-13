import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instagram_clone/core/constants/colors.dart';
import 'package:instagram_clone/core/constants/sizes.dart';
import 'package:instagram_clone/core/helpers/helpers.dart';
import 'package:instagram_clone/data/home/bloc/post/post_bloc.dart';
import 'package:instagram_clone/data/home/model/post.dart';
import 'package:instagram_clone/presentation/blocs/carousel/carousel_bloc.dart';
import 'package:instagram_clone/presentation/pages/home/widgets/slider_dot.dart';

class PostWidget extends StatelessWidget {
  final Post post;
  const PostWidget({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    var photoList = post.media;
    int currentIndex = 0;
    int carouselStateId = post.id! - 1;
    final postBloc = context.read<PostBloc>();
    return Column(
      children: [
        info(),
        BlocBuilder<CarouselBloc, List<CarouselState>>(
          builder: (context, state) {
            final carouselState = state[carouselStateId];

            if (carouselState is CarouselUpdated) {
              currentIndex = carouselState.currentIndex;
            }

            return photos(
                photoList!, context, postBloc, currentIndex, carouselStateId);
          },
        ),
        actions(photoList!, postBloc, carouselStateId),
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Row(
            children: [
              // CircleAvatar(
              //   radius: 15,
              //   backgroundImage: post.user!.image != null
              //       ? NetworkImage(post.user!.image) as ImageProvider
              //       : AssetImage(photosPath('oval.png')),
              // ),
              // const SizedBox(
              //   width: 10,
              // ),
              RichText(
                text: TextSpan(
                  style:
                      const TextStyle(color: primaryBlackColor, fontSize: 17),
                  children: [
                    // TextSpan(text: 'Liked by'),
                    // TextSpan(
                    //   text: ' craig_love',
                    //   style: TextStyle(fontWeight: FontWeight.bold),
                    // ),
                    // TextSpan(text: ' and'),
                    TextSpan(
                      text: '${post.likes} like',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Row(
            children: [
              Expanded(
                child: Text.rich(
                  TextSpan(
                    style: const TextStyle(
                      color: primaryBlackColor,
                      fontSize: 17,
                    ),
                    children: [
                      TextSpan(
                          text: post.user!.username,
                          style: const TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(text: " ${post.description}")
                    ],
                  ),
                  overflow: TextOverflow
                      .visible, // or TextOverflow.visible based on your requirement
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  ListTile info() {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: AssetImage(photosPath('oval.png')),
      ),
      title: Row(
        children: [
          Text(
            post.user!.username!,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            width: 5,
          ),
          const Icon(
            Icons.verified,
            color: primaryButtonColor,
          )
        ],
      ),
      // subtitle: const Text(
      //   'Tokyo, Japan',
      //   style: TextStyle(color: Colors.black),
      // ),
      trailing:
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_horiz)),
    );
  }

  Row actions(List<Media> photoList, PostBloc postBloc, int carouselStateId) {
    return Row(
      children: [
        IconButton(
            onPressed: () {
              postBloc.add(LikePost(postId: post.id!));
            },
            icon: post.liked! ? likedIcon() : unLikedIcon()),
        IconButton(
            onPressed: () {}, icon: Image.asset(iconsPath('comment-icon.png'))),
        IconButton(onPressed: () {}, icon: Image.asset(iconsPath('dm.png'))),
        const SizedBox(
          width: 30,
        ),
        sliderDots(photoList, carouselStateId),
        const Spacer(),
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.bookmark_border,
              size: homeScreenIconSize,
            ))
      ],
    );
  }

  Icon unLikedIcon() {
    return const Icon(
      Icons.favorite_border,
      size: homeScreenIconSize,
      color: Colors.black54,
    );
  }

  Icon likedIcon() {
    return const Icon(
      Icons.favorite,
      size: homeScreenIconSize,
      color: Colors.red,
    );
  }

  GestureDetector photos(List<Media> photoList, BuildContext context,
      PostBloc postBloc, int currentIndex, int carouselStateId) {
    return GestureDetector(
      onDoubleTap: () {
        postBloc.add(LikePost(postId: post.id!));
      },
      child: CarouselSlider(
          items: photoList.map((image) {
            return Stack(children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Image.network(
                  image.path!,
                  fit: BoxFit.fitWidth,
                ),
              ),
              Positioned(
                right: 10,
                top: 10,
                child: Container(
                  width: 50,
                  height: 30,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(20)),
                  child: Center(
                      child: Text(
                    '${currentIndex + 1}/${photoList.length}',
                    style: const TextStyle(color: primaryColor),
                  )),
                ),
              )
            ]);
          }).toList(),
          options: CarouselOptions(
            enableInfiniteScroll: false,
            height: 300,
            enlargeCenterPage: true,
            viewportFraction: 1,
            onPageChanged: (index, reason) {
              context
                  .read<CarouselBloc>()
                  .add(CarouselChanged(carouselStateId, index));
            },
          )),
    );
  }

  SizedBox sliderDots(List<Media> photoList, int carouselStateId) {
    return SizedBox(
      width: 50,
      height: 20,
      child: ListView.builder(
          itemBuilder: (context, index) {
            return BlocBuilder<CarouselBloc, List<CarouselState>>(
              builder: (context, state) {
                final carouselState = state[carouselStateId];

                if (carouselState is CarouselUpdated) {
                  return SliderDot(
                    active: carouselState.currentIndex == index,
                  );
                }

                return SliderDot(active: index == 0);
              },
            );
          },
          itemCount: photoList.length,
          scrollDirection: Axis.horizontal),
    );
  }
}
