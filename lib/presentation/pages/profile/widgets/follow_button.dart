import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instagram_clone/core/helpers/style.dart';
import 'package:instagram_clone/presentation/global_widgets/custom_blue_button.dart';
import 'package:instagram_clone/presentation/global_widgets/custom_white_action_button.dart';

class FollowButton extends StatelessWidget {
  const FollowButton({
    super.key,
    required this.followed,
  });
  final bool followed;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
        child: followed
            ? CustomWhiteActionButton(
                child: Text(
                  'Followed',
                  style: AppStyles.profileEditButtonTextStyle,
                ),
                onPressed: () {},
              )
            : CustomBlueButton(
                child: Text(
                  'Follow',
                  style: AppStyles.profileEditButtonTextStyle,
                ),
                onPressed: () {},
              ));
  }
}
