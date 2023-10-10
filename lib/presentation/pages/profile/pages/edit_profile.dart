import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/core/constants/colors.dart';

@RoutePage()
class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: const Text(
          'Edit profile',
          style: TextStyle(color: primaryBlackColor),
        ),
        leading: const Padding(
          padding: EdgeInsets.only(top: 20, left: 10),
          child: Text('Cancel', style: TextStyle(color: primaryGreyColor, fontSize: 16),),
        ),
        actions: [TextButton(onPressed: () {}, child: const Text('Done'))],
      ),
    );
  }
}
