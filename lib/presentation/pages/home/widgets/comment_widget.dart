import 'package:flutter/material.dart';
import 'package:instagram_clone/core/constants/colors.dart';
import 'package:instagram_clone/core/helpers/helpers.dart';
import 'package:instagram_clone/data/auth/model/model.dart';
import 'package:instagram_clone/data/home/model/comment.dart';

class CommentWidget extends StatefulWidget {
  const CommentWidget({super.key, required this.comment});
  final Comment comment;

  @override
  State<CommentWidget> createState() => _CommentWidgetState();
}

class _CommentWidgetState extends State<CommentWidget> {
  @override
  Widget build(BuildContext context) {
    UserModel user = widget.comment.user!;
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: user.image != null
            ? NetworkImage(user.image)
            : AssetImage(photosPath('oval.png')) as ImageProvider,
      ),
      title: Text.rich(
        TextSpan(children: [
          TextSpan(
              text: user.username,
              style: const TextStyle(fontWeight: FontWeight.bold)),
          TextSpan(text: " ${widget.comment.text}")
        ]),
        style: const TextStyle(overflow: TextOverflow.visible),
      ),
      subtitle: Text(
        widget.comment.timeDiff!,
        style: const TextStyle(color: primaryGreyColor),
      ),
    );
  }
}
