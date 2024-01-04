import 'package:flutter/material.dart';
import 'package:instagram_clone/data/auth/model/model.dart';
import 'package:instagram_clone/presentation/pages/home/widgets/profile_photo_widget.dart';

class RoomCandidate extends StatefulWidget {
  const RoomCandidate({
    super.key,
    required this.size,
    required this.messageController,
    required this.user,
  });

  final Size size;
  final TextEditingController messageController;
  final UserModel user;

  @override
  State<RoomCandidate> createState() => _RoomCandidateState();
}

class _RoomCandidateState extends State<RoomCandidate> {

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 3),
      child: Container(
        padding: const EdgeInsets.only(top: 5),
        decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(30)),
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: widget.size.width),
          child: ListTile(
            leading: ProfilePhotoWidget(
              radius: 45,
              isMe: false,
              photo: widget.user.image,
            ),
            title: Text(widget.user.username!),
          ),
        ),
      ),
    );
  }

  // void _showTextFieldDialog(BuildContext context, Size size,
  //     TextEditingController messageController, UserModel user, Room room) {
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         actionsPadding: const EdgeInsets.all(0),
  //         contentPadding: const EdgeInsets.only(top: 15, right: 15, left: 15),
  //         content: CustomTextField(
  //             size: size,
  //             controller: messageController,
  //             hint: 'Type a message',
  //             borderRadius: 15),
  //         actions: <Widget>[
  //           TextButton(
  //             child: const Text('Cancel'),
  //             onPressed: () {
  //               Navigator.of(context).pop(); // Dialog'u kapat
  //             },
  //           ),
  //           TextButton(
  //             child: const Text('Send'),
  //             onPressed: () {
  //               // Tamam butonuna basıldığında yapılacak işlemler
  //               if (messageController.text.isNotEmpty) {
  //                 webSocketService.createRoom(user.id!);
  //                 Navigator.of(context).pop();
  //               }
  //             },
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }
}
