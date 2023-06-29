// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GreyLine extends StatelessWidget {
  const GreyLine({
    Key? key,
    required this.sizeRate,
    this.customColor,
  }) : super(key: key);
  final double sizeRate;
  final Color? customColor;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: 1.h,
      width: size.width * sizeRate,
      decoration: BoxDecoration(color: customColor ?? Colors.grey),
    );
  }
}
