import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instagram_clone/core/constants/colors.dart';
import 'package:instagram_clone/core/helpers/data.dart';
import 'package:instagram_clone/core/helpers/helpers.dart';
import 'package:instagram_clone/presentation/pages/home/widgets/post_widget.dart';
import 'package:instagram_clone/presentation/pages/home/widgets/story_widget.dart';

import '../../global_widgets/grey_line.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        SizedBox(height: 10.h,),
        stories(),
        SizedBox(height: 10.h,),
        const GreyLine(sizeRate: 1),
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) {
              return const Padding(
                padding: EdgeInsets.only(bottom: 15),
                child: PostWidget(),
              );
            },
            itemCount: 5,
          ),
        )
      ]),
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
              child: StoryWidget(radius: 60.w, photo: story['photo'], text: 'joshua_l',));
        },
        scrollDirection: Axis.horizontal,
      ),
    );
  }

  AppBar appBar() {
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
          onPressed: () {},
          icon: Image.asset(iconsPath('dm.png')),
        ),
      ],
    );
  }
}
