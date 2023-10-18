import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instagram_clone/core/constants/colors.dart';
import 'package:instagram_clone/core/constants/sizes.dart';
import 'package:instagram_clone/core/helpers/helpers.dart';
import 'package:instagram_clone/data/home/bloc/comment/comment_bloc.dart';
import 'package:instagram_clone/data/home/bloc/post/post_bloc.dart';
import 'package:instagram_clone/data/home/model/post.dart';
import 'package:instagram_clone/presentation/blocs/carousel/carousel_bloc.dart';
import 'package:instagram_clone/presentation/models/carousel.dart';
import 'package:instagram_clone/presentation/pages/home/pages/comments.dart';
import 'package:instagram_clone/presentation/pages/home/widgets/slider_dot.dart';

class PostWidget extends StatefulWidget {
  final Post post;
  final Carousel carousel;
  const PostWidget({super.key, required this.post, required this.carousel});

  @override
  State<PostWidget> createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation colorAnimation;
  late Animation<double> sizeAnimation;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));

    colorAnimation = ColorTween(begin: Colors.grey.shade400, end: Colors.red)
        .animate(
            CurvedAnimation(parent: animationController, curve: Curves.easeIn));
    sizeAnimation = TweenSequence(<TweenSequenceItem<double>>[
      TweenSequenceItem(tween: Tween(begin: 1, end: 30), weight: 1),
      TweenSequenceItem(tween: Tween(begin: 30, end: 50), weight: 50),
      TweenSequenceItem(tween: Tween(begin: 50, end: 70), weight: 70),
      TweenSequenceItem(tween: Tween(begin: 70, end: 50), weight: 50),
      TweenSequenceItem(tween: Tween(begin: 50, end: 30), weight: 50),
    ]).animate(
        CurvedAnimation(parent: animationController, curve: Curves.easeIn));

    animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        animationController.reset();
      }
    });
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var photoList = widget.post.media;
    final postBloc = context.read<PostBloc>();
    final commentBloc = context.read<CommentBloc>();
    return Column(
      children: [
        info(),
        BlocBuilder<CarouselBloc, CarouselState>(
          builder: (context, state) {
            int currentIndex = 0;
            if (state is CarouselUpdated &&
                state.carousel.postId == widget.carousel.postId) {
              currentIndex = state.carousel.currentIndex;
            }
            return photos(photoList!, context, postBloc, currentIndex,
                widget.carousel.postId);
          },
        ),
        actions(photoList!, postBloc, commentBloc, widget.carousel.postId),
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
                      text: '${widget.post.likes} like',
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
                          text: widget.post.user!.username,
                          style: const TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(text: " ${widget.post.description}")
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
            widget.post.user!.username!,
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

  Row actions(List<Media> photoList, PostBloc postBloc, CommentBloc commentBloc,
      int carouselStateId) {
    return Row(
      children: [
        IconButton(
            onPressed: () {
              postBloc.add(LikePost(postId: widget.post.id!));
            },
            icon: widget.post.liked! ? likedIcon() : unLikedIcon()),
        IconButton(
            onPressed: () {
              _showModalBottomSheet();
              commentBloc.add(ShowComments(postId: widget.post.id!));
            },
            icon: Image.asset(iconsPath('comment-icon.png'))),
        IconButton(onPressed: () {}, icon: Image.asset(iconsPath('dm.png'))),
        const SizedBox(
          width: 30,
        ),
        sliderDots(photoList),
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
        postBloc.add(LikePost(postId: widget.post.id!));
        animationController.forward();
      },
      child: Stack(
        children: [
          CarouselSlider(
              items: photoList.map((image) {
                return Stack(children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 300,
                    child: Image.network(
                      alignment: Alignment.topCenter,
                      image.path!,
                      fit: BoxFit.cover,
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
                      .add(CarouselChanged(widget.carousel, index));
                },
              )),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 0,
            child: AnimatedBuilder(
              animation: animationController,
              builder: (context, child) {
                return Icon(
                  Icons.favorite,
                  color: colorAnimation.value,
                  size: sizeAnimation.value,
                );
              },
            ),
          )
        ],
      ),
    );
  }

  SizedBox sliderDots(List<Media> photoList) {
    return SizedBox(
      width: 50,
      height: 20,
      child: ListView.builder(
          itemBuilder: (context, index) {
            return BlocBuilder<CarouselBloc, CarouselState>(
              builder: (context, state) {
                if (state is CarouselUpdated &&
                    state.carousel.postId == widget.carousel.postId) {
                  return SliderDot(
                    active: state.carousel.currentIndex == index,
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

  void _showModalBottomSheet() {
    Size size = MediaQuery.of(context).size;
    showModalBottomSheet(
      isScrollControlled: true,
      useSafeArea: true,
      enableDrag: true,
      constraints: BoxConstraints(
          maxHeight: size.height,
          maxWidth: size.width,
          minHeight: size.height * 0.5),
      context: context,
      builder: (context) {
        return CommentScreen(
          postId: widget.post.id!,
        );
      },
    );
  }
}
