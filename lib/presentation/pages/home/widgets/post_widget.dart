import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram_clone/core/constants/colors.dart';
import 'package:instagram_clone/core/constants/sizes.dart';
import 'package:instagram_clone/core/helpers/data.dart';
import 'package:instagram_clone/core/helpers/helpers.dart';
import 'package:instagram_clone/presentation/blocs/carousel/carousel_bloc.dart';
import 'package:instagram_clone/presentation/pages/home/widgets/slider_dot.dart';

class PostWidget extends StatelessWidget {
  const PostWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var photoList = postData[0]['gallery'] as List<String>;
    int currentIndex = 0;
    return Column(
      children: [
        info(),
        BlocBuilder<CarouselBloc, CarouselState>(
          builder: (context, state) {
            if (state is CarouselUpdated) {
              currentIndex = state.currentIndex;
            }
            return photos(photoList, context, currentIndex);
          },
        ),
        actions(photoList),
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
              )
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

  Row actions(List<String> photoList) {
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
      List<String> photoList, BuildContext context, int currentIndex) {
    return CarouselSlider(
        items: photoList.map((image) {
          return Stack(children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Image.asset(
                image,
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
                  '${currentIndex + 1}/3',
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
            context.read<CarouselBloc>().add(CarouselChanged(index));
          },
        ));
  }

  SizedBox sliderDots(List<String> photoList) {
    return SizedBox(
      width: 50,
      height: 20,
      child: ListView.builder(
          itemBuilder: (context, index) {
            return BlocBuilder<CarouselBloc, CarouselState>(
              builder: (context, state) {
                return SliderDot(
                  active:
                      state is CarouselUpdated && state.currentIndex == index,
                );
              },
            );
          },
          itemCount: photoList.length,
          scrollDirection: Axis.horizontal),
    );
  }
}
