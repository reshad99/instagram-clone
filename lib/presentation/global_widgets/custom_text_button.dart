// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';


class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    Key? key,
    required this.child,
    required this.onPressed,
  }) : super(key: key);
  final Widget child;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: ButtonStyle(
            overlayColor: MaterialStateProperty.all(Colors.transparent)),
        onPressed: () {
          onPressed;
        },
        child: child);
  }
}
