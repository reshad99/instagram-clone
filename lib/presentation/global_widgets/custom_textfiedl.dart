// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instagram_clone/core/constants/colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.size,
    required this.controller,
    required this.hint,
    this.prefixIcon,
  }) : super(key: key);
  final Size size;
  final TextEditingController controller;
  final String hint;
  final Widget? prefixIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        disabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          prefixIcon: prefixIcon ?? const SizedBox(),
          contentPadding:
              EdgeInsets.symmetric(vertical: 15.h, horizontal: 15.w),
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.grey),
          border: InputBorder.none,
          fillColor: primaryInputColor,
          filled: true),
    );
  }
}
