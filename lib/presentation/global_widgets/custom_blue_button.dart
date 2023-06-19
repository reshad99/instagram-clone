// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:instagram_clone/core/constants/colors.dart';

class CustomBlueButton extends StatelessWidget {
  const CustomBlueButton({
    Key? key,
    required this.child,
    required this.onPressed,
  }) : super(key: key);
  final Widget child;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        onPressed();
      },
      style: ElevatedButton.styleFrom(backgroundColor: primaryButtonColor),
      child: child,
    );
  }
}
