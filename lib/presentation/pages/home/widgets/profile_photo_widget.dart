// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instagram_clone/core/constants/colors.dart';
import 'package:instagram_clone/core/helpers/helpers.dart';

class ProfilePhotoWidget extends StatelessWidget {
  const ProfilePhotoWidget({
    Key? key,
    required this.radius,
    this.photo,
    this.text,
    required this.isMe,
  }) : super(key: key);
  final double radius;
  final String? photo;
  final String? text;
  final bool isMe;

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
        // context.navigateTo(StoryViewRoute(statusCount: 6));
      },
      child: Column(
        children: [
          Container(
            width: radius + 5,
            height: radius + 5,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  primaryGreyColor,
                  primaryGreyColor,
                  primaryGreyColor,
                  primaryGreyColor,
                  primaryGreyColor,
                  primaryGreyColor,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomLeft,
              ),
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            padding: const EdgeInsets.all(3.0),
            child: Stack(
              children: [
                Container(
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
                isMe
                    ? Positioned(
                        right: 0,
                        bottom: 0,
                        child: GestureDetector(
                          onTap: () {
                            pickImageForStory(context);
                          },
                          child: const Icon(
                            Icons.add,
                            color: Colors.blueAccent,
                          ),
                        ))
                    : const SizedBox()
              ],
            ),
          ),
          SizedBox(
            height: text != null ? 5.h : 0,
          ),
          text != null ? Text(text!) : const SizedBox()
        ],
      ),
    );
  }
}
