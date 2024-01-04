import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram_clone/data/message/bloc/message/message_bloc.dart';
import 'package:instagram_clone/data/message/model/message.dart';
import 'package:instagram_clone/data/message/model/room.dart';
import 'package:instagram_clone/presentation/global_screens/loading.dart';
import 'package:instagram_clone/presentation/global_widgets/custom_textfiedl.dart';
import 'package:instagram_clone/presentation/pages/home/widgets/message_widget.dart';
import 'package:instagram_clone/presentation/pages/home/widgets/profile_photo_widget.dart';
import 'package:instagram_clone/services/locator.dart';
import 'package:instagram_clone/services/response/error_handler.dart';
import 'package:instagram_clone/services/socket/websocket.dart';

@RoutePage()
class MessagesScreen extends StatefulWidget {
  const MessagesScreen({super.key, required this.room});
  final Room room;

  @override
  State<MessagesScreen> createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  late TextEditingController typeMessageController;
  late WebSocketService webSocketService;
  List<Message> messages = [];

  @override
  void initState() {
    super.initState();
    context.read<MessageBloc>().add(FetchMessages(roomId: widget.room.id!));
    typeMessageController = TextEditingController();
    webSocketService = locator<WebSocketService>()
      ..messages.listen((data) {
        data = jsonDecode(data);
        debugPrint("Websocket $data");
        if (data['event'] == 'MessageReceived') {
          receiveMessageOnUI(data);
        } else if (data['event'] == 'MessageSended') {
          sendMessageOnUI();
          typeMessageController.text = '';
        }
      });
    webSocketService.joinRoom(widget.room.uid!);
  }

  @override
  void dispose() {
    typeMessageController.dispose();
    if (messages.isEmpty) {
      webSocketService.deleteRoom(widget.room.id!);
    }
    super.dispose();
  }

  void sendMessageOnUI() {
    if (typeMessageController.text.isNotEmpty) {
      context
          .read<MessageBloc>()
          .add(NewMessageSended(message: typeMessageController.text));
    }
  }

  void receiveMessageOnUI(data) {
    if (data['roomUid'] == widget.room.uid) {
      context.read<MessageBloc>().add(
          NewMessageReceived(widget.room.myMate!, message: data['message']));
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    debugPrint('Websocket sehife yuklendi');
    return SafeArea(
      child: Scaffold(
        appBar: appBar(),
        body: BlocBuilder<MessageBloc, MessageState>(
          builder: (context, state) {
            if (state is MessagesError) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                ErrorHandler.showError(context, state.errorResponse);
              });
            }

            if (state is MessagesLoading) {
              return const LoadingScreen();
            }

            if (state is MessagesLoaded) {
              return buildMessages(state, context, size);
            }

            return const SizedBox();
          },
        ),
      ),
    );
  }

  Stack buildMessages(MessagesLoaded state, BuildContext context, Size size) {
    return Stack(children: [
      Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, bottom: 50),
        child: ListView.builder(
          reverse: true,
          itemCount: state.messages.length,
          itemBuilder: (context, index) {
            messages = state.messages;
            Message message = messages[index];
            return MessageWidget(
              message: message,
            );
          },
        ),
      ),
      buildTextField(context, size)
    ]);
  }

  Positioned buildTextField(BuildContext context, Size size) {
    return Positioned(
      bottom: 0,
      right: 0,
      left: 0,
      child: CustomTextField(
          suffixIcon: IconButton(
              onPressed: () {
                debugPrint('Websocket onpressed tetiklendi');
                if (typeMessageController.text.isNotEmpty) {
                  debugPrint('Websocket sendMessage');

                  webSocketService.sendMessage(
                      widget.room.uid!, typeMessageController.text);
                }
              },
              icon: const Icon(
                Icons.send,
                color: Colors.blueAccent,
              )),
          prefixIcon:
              IconButton(onPressed: () {}, icon: const Icon(Icons.attach_file)),
          size: size,
          controller: typeMessageController,
          hint: 'Type message',
          borderRadius: 20),
    );
  }

  AppBar appBar() {
    return AppBar(
      title: Row(
        children: [
          ProfilePhotoWidget(
            radius: 42,
            isMe: false,
            photo: widget.room.myMate!.image,
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            '@${widget.room.myMate!.username}',
            style: TextStyle(color: Colors.grey.shade700),
          )
        ],
      ),
    );
  }
}
