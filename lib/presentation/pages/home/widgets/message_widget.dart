import 'package:flutter/material.dart';
import 'package:instagram_clone/data/message/model/message.dart';
import 'package:instagram_clone/presentation/pages/home/widgets/profile_photo_widget.dart';
import 'package:instagram_clone/presentation/pages/home/widgets/text_message.dart';

class MessageWidget extends StatelessWidget {
  const MessageWidget({
    super.key,
    required this.message,
  });
  final Message message;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          message.isMine! ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        !message.isMine!
            ? const ProfilePhotoWidget(radius: 30, isMe: false)
            : const SizedBox(),
        const SizedBox(
          width: 5,
        ),
        SizedBox(
          child: Card(
            color: message.isMine!
                ? const Color.fromRGBO(84, 64, 255, 1)
                : Colors.grey.shade100,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0)),
            child: TextMessageCard(
              message: message,
            ),
          ),
        )
      ],
    );
  }
}
