import 'package:flutter/material.dart';
import 'package:instagram_clone/data/message/model/message.dart';

class TextMessageCard extends StatelessWidget {
  const TextMessageCard({super.key, required this.message});
  final Message message;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        ConstrainedBox(
          constraints: BoxConstraints(maxWidth: size.width - 100),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              message.message!,
              style: TextStyle(
                  fontSize: 16,
                  color: message.isMine! ? Colors.white : Colors.black),
            ),
          ),
        ),
      ],
    );
  }
}
