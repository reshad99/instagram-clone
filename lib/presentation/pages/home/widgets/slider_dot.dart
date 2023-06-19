import 'package:flutter/material.dart';
import 'package:instagram_clone/core/constants/colors.dart';

class SliderDot extends StatelessWidget {
  const SliderDot({
    super.key, required this.active,
  });
  final bool active;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5),
      child: Container(
        width: 6,
        height: 6,
        decoration: BoxDecoration(
            color: active == true ? Colors.blue : primaryGreyColor,
            shape: BoxShape.circle),
      ),
    );
  }
}
