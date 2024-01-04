import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/core/constants/colors.dart';
import 'package:instagram_clone/core/helpers/helpers.dart';
import 'package:instagram_clone/data/auth/model/model.dart';
import 'package:instagram_clone/presentation/global_widgets/custom_blue_button.dart';
import 'package:instagram_clone/services/routes/nested_router.gr.dart';

class UserListItem extends StatefulWidget {
  const UserListItem({super.key, required this.user});
  final UserModel user;

  @override
  State<UserListItem> createState() => _UserListItemState();
}

class _UserListItemState extends State<UserListItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.navigateTo(
            UserProfileRoute(user: widget.user));
      },
      child: ListTile(
        leading: CircleAvatar(backgroundImage: getPhoto(widget.user.image)),
        title: Text(
          widget.user.username!,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        trailing: widget.user.followed!
            ? ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(backgroundColor: primaryColor),
                child: const Text(
                  'Followed',
                  style: TextStyle(color: primaryBlackColor),
                ),
              )
            : CustomBlueButton(
                child: const Text('Follow'),
                onPressed: () {},
              ),
      ),
    );
  }
}
