import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 15.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Reshad Memmedov',
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 2.h,
          ),
          SizedBox(
              width: 200.w,
              child: const Text.rich(TextSpan(
                  style: TextStyle(overflow: TextOverflow.visible),
                  children: [
                    TextSpan(
                        text:
                            'Software Engineer Reshad. Everyhting is designed ')
                  ])))
        ],
      ),
    );
  }
}