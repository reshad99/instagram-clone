import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instagram_clone/core/constants/colors.dart';
import 'package:instagram_clone/core/constants/sizes.dart';
import 'package:instagram_clone/core/helpers/helpers.dart';
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
    return Column(
      children: [
        info(),
        BlocBuilder<CarouselBloc, List<CarouselState>>(
          builder: (context, state) {
            final carouselState = state[post.id!];

            if (carouselState is CarouselUpdated) {
              currentIndex = carouselState.currentIndex;
            }

            return photos(photoList!, context, currentIndex);
          },
        ),
        actions(photoList!),
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Row(
            children: [
              CircleAvatar(
                radius: 15,
                backgroundImage: AssetImage(photosPath('oval.png')),
              ),
              const SizedBox(
                width: 10,
              ),
              RichText(
                text: const TextSpan(
                  style: TextStyle(color: primaryBlackColor, fontSize: 17),
                  children: [
                    TextSpan(text: 'Liked by'),
                    TextSpan(
                      text: ' craig_love',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(text: ' and'),
                    TextSpan(
                      text: ' 48.994 others',
                      style: TextStyle(fontWeight: FontWeight.bold),
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
        const Padding(
          padding: EdgeInsets.only(left: 10),
          child: Row(
            children: [
              Expanded(
                child: Text.rich(
                  TextSpan(
                    style: TextStyle(
                      color: primaryBlackColor,
                      fontSize: 17,
                    ),
                    children: [
                      TextSpan(
                          text: 'joshua_l',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(
                          text:
                              ' The game was in Japan was amazing and I wanted to share some photod')
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
      title: const Row(
        children: [
          Text(
            'joshua_l',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            width: 5,
          ),
          Icon(
            Icons.verified,
            color: primaryButtonColor,
          )
        ],
      ),
      subtitle: const Text(
        'Tokyo, Japan',
        style: TextStyle(color: Colors.black),
      ),
      trailing:
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_horiz)),
    );
  }

  Row actions(List<Media> photoList) {
    return Row(
      children: [
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.favorite_border,
              size: homeScreenIconSize,
              color: Colors.black54,
            )),
        IconButton(
            onPressed: () {}, icon: Image.asset(iconsPath('comment-icon.png'))),
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

  CarouselSlider photos(
      List<Media> photoList, BuildContext context, int currentIndex) {
    return CarouselSlider(
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
            context.read<CarouselBloc>().add(CarouselChanged(post.id!, index));
          },
        ));
  }

  SizedBox sliderDots(List<Media> photoList) {
    return SizedBox(
      width: 50,
      height: 20,
      child: ListView.builder(
          itemBuilder: (context, index) {
            return BlocBuilder<CarouselBloc, List<CarouselState>>(
              builder: (context, state) {
                final carouselState = state[post.id!];

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
