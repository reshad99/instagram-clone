import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/core/constants/colors.dart';
import 'package:instagram_clone/data/message/model/room.dart';
import 'package:instagram_clone/presentation/pages/home/widgets/profile_photo_widget.dart';
import 'package:instagram_clone/services/routes/nested_router.gr.dart';

class RoomWidget extends StatelessWidget {
  const RoomWidget({
    super.key,
    required this.room,
  });

  final Room room;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.navigateTo(MessagesRoute(room: room));
      },
      child: Row(
        children: [
          ProfilePhotoWidget(
            radius: 50,
            photo: room.myMate!.image,
            isMe: false,
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                room.myMate!.username!,
                style: const TextStyle(fontSize: 20),
              ),
              Row(
                children: [
                  SizedBox(
                    width: 160,
                    child: Text(
                      room.lastMessage!.message!,
                      style: const TextStyle(
                          fontSize: 20, color: primaryGreyColor),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text.rich(TextSpan(
                      style: const TextStyle(
                          fontSize: 15,
                          color: primaryGreyColor,
                          overflow: TextOverflow.ellipsis),
                      children: [
                        const WidgetSpan(
                            child: Padding(
                          padding: EdgeInsets.only(bottom: 5),
                          child: Text('.'),
                        )),
                        TextSpan(text: ' ${room.lastMessage!.timeDiff}')
                      ]))
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
