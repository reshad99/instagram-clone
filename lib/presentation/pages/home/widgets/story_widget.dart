// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instagram_clone/core/constants/colors.dart';
import 'package:instagram_clone/core/helpers/helpers.dart';
import 'package:instagram_clone/data/home/model/status.dart';
import 'package:instagram_clone/services/routes/nested_router.gr.dart';

class StoryWidget extends StatelessWidget {
  const StoryWidget({
    Key? key,
    required this.radius,
    required this.photo,
    required this.index,
    required this.statuses,
    this.text,
  }) : super(key: key);
  final double radius;
  final String? photo;
  final String? text;
  final int index;
  final List<Status> statuses;

  @override
  Widget build(BuildContext context) {
    // return Stack(children: [
    //   Container(
    //     width: radius + 5,
    //     height: radius + 5,
    //     decoration: BoxDecoration(
    //       shape: BoxShape.circle,
    //         border: Border.all(color: Colors.red, width: 4)),
    //   ),
    //   Padding(
    //     padding: const EdgeInsets.all(3.0),
    //     child: Container(
    //       width: radius,
    //       height: radius,
    //       decoration: BoxDecoration(
    //           shape: BoxShape.circle,
    //           image:
    //               DecorationImage(image: AssetImage(photo), fit: BoxFit.cover)),
    //     ),
    //   ),
    // ]);

    return GestureDetector(
      onTap: () {
        context.navigateTo(StoryViewRoute(index: index, statuses: statuses));
      },
      child: Column(
        children: [
          Container(
            width: radius + 5,
            height: radius + 5,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  storyRedColor,
                  storyPinkColor,
                  storyPinkColor,
                  storyRedColor,
                  storyYellowColor,
                  storyYellowColor,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomLeft,
              ),
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            padding: const EdgeInsets.all(3.0),
            child: Container(
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Colors.white),
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(image: getPhoto(photo))),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 5.h,
          ),
          text != null ? Text(text!) : const SizedBox()
        ],
      ),
    );
  }
}
