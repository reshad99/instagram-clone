import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instagram_clone/core/constants/colors.dart';
import 'package:instagram_clone/core/helpers/helpers.dart';
import 'package:instagram_clone/presentation/pages/home/widgets/profile_photo_widget.dart';

class Highlights extends StatelessWidget {
  const Highlights({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 15.w),
      child: SizedBox(
        height: 130.h,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            if (index == 0) {
              return Padding(
                padding: EdgeInsets.only(right: 10.w),
                child: Column(
                  children: [
                    Container(
                      width: 85,
                      height: 85,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: primaryGreyColor,
                            width: 1,
                          )),
                      child: const Icon(
                        Icons.add,
                        size: 50,
                      ),
                    ),
                    const Text('New')
                  ],
                ),
              );
            }

            return Padding(
              padding: EdgeInsets.only(right: 10.w),
              child: ProfilePhotoWidget(
                  isMe: true,
                  radius: 80,
                  photo: photosPath('own-pp.jpg'),
                  text: 'Friends'),
            );
          },
          itemCount: 5,
        ),
      ),
    );
  }
}
