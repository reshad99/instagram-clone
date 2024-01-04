import 'package:flutter/material.dart';
import 'package:instagram_clone/data/auth/model/model.dart';
import 'package:instagram_clone/presentation/pages/profile/widgets/user_list_widget.dart';

class UserList extends StatelessWidget {
  const UserList({super.key, required this.users});
  final List<UserModel> users;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(),
      body: UserListWidget(users: users),
    ));
  }
}


