// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:instagram_clone/core/constants/sizes.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget({
    Key? key,
    required this.text,
  }) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(
        text,
        style: TextStyle(
            fontSize: notificationsFontSize.w, fontWeight: FontWeight.bold),
      ),
    );
  }
}
