// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:instagram_clone/core/constants/colors.dart';

class ButtonBox extends StatelessWidget {
  const ButtonBox({
    Key? key,
    required this.child,
  }) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 307,
      height: 44,
      child: child,
    );
  }
}
