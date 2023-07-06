// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomWhiteActionButton extends StatelessWidget {
  const CustomWhiteActionButton({
    Key? key,
    required this.child,
    this.customColor,
    this.borderRadius,
  }) : super(key: key);
  final Widget child;
  final Color? customColor;
  final double? borderRadius;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          fixedSize: Size(110, 10),
          backgroundColor: customColor ?? Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 5)),
          side: BorderSide(width: 1, color: Colors.grey.shade400),
        ),
        onPressed: () {},
        child: child);
  }
}
