import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instagram_clone/core/helpers/style.dart';
import 'package:instagram_clone/presentation/global_widgets/custom_white_action_button.dart';

class EditProfileButton extends StatelessWidget {
  const EditProfileButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
        child: CustomWhiteActionButton(
            borderRadius: 10,
            customColor: Colors.white70,
            child: Text(
              'Edit profile',
              style: AppStyles.profileEditButtonTextStyle,
            )));
  }
}