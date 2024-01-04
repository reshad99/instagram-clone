import 'package:flutter/material.dart';
import 'package:instagram_clone/data/auth/model/model.dart';
import 'package:instagram_clone/presentation/pages/profile/widgets/user_list_item.dart';

class UserListWidget extends StatelessWidget {
  const UserListWidget({
    super.key,
    required this.users,
  });

  final List<UserModel> users;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index) {
        UserModel user = users[index];
        return UserListItem(
          user: user,
        );
      },
    );
  }
}
