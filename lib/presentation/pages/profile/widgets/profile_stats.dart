import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instagram_clone/core/helpers/helpers.dart';
import 'package:instagram_clone/core/helpers/style.dart';
import 'package:instagram_clone/presentation/pages/home/widgets/story_widget.dart';

class ProfileStats extends StatelessWidget {
  const ProfileStats({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 15.w,
        ),
        StoryWidget(
          radius: 100,
          photo: photosPath('own-pp.jpg'),
        ),
        SizedBox(
          width: 30.w,
        ),
        const Column(
          children: [
            Text(
              '54',
              style: AppStyles.profileStats,
            ),
            Text(
              'Posts',
              style: AppStyles.profileStatsText,
            )
          ],
        ),
        SizedBox(
          width: 20.w,
        ),
        const Column(
          children: [
            Text(
              '675M',
              style: AppStyles.profileStats,
            ),
            Text(
              'Followers',
              style: AppStyles.profileStatsText,
            )
          ],
        ),
        SizedBox(
          width: 20.w,
        ),
        const Column(
          children: [
            Text(
              '162',
              style: AppStyles.profileStats,
            ),
            Text(
              'Following',
              style: AppStyles.profileStatsText,
            )
          ],
        ),
      ],
    );
  }
}
