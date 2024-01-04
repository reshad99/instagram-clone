import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram_clone/data/auth/model/model.dart';
import 'package:instagram_clone/data/message/model/room.dart';
import 'package:instagram_clone/data/profile/bloc/bloc/follow_bloc.dart';
import 'package:instagram_clone/presentation/global_screens/loading.dart';
import 'package:instagram_clone/presentation/global_widgets/custom_textfiedl.dart';
import 'package:instagram_clone/presentation/pages/home/widgets/room_candidate.dart';
import 'package:instagram_clone/services/local_database/local_database.dart';
import 'package:instagram_clone/services/locator.dart';
import 'package:instagram_clone/services/routes/nested_router.gr.dart';
import 'package:instagram_clone/services/socket/websocket.dart';

@RoutePage()
class CreateRoomScreen extends StatefulWidget {
  const CreateRoomScreen({super.key});

  @override
  State<CreateRoomScreen> createState() => _CreateRoomScreenState();
}

class _CreateRoomScreenState extends State<CreateRoomScreen> {
  late TextEditingController searchController;
  late TextEditingController messageController;
  late WebSocketService webSocketService;
  Room room = Room();

  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
    messageController = TextEditingController();
    webSocketService = locator<WebSocketService>()
      ..messages.listen((event) {
        var message = jsonDecode(event);
        if (message['event'] == 'RoomCreated') {
          room = Room.fromJson(message['room']);
          context.navigateTo(MessagesRoute(room: room));
        }
      });
    context.read<FollowBloc>().add(ShowFollowers(
        userId: (locator<LocalDatabase>().get('user') as UserModel).id!));
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          CustomTextField(
              size: size,
              controller: searchController,
              hint: 'Search',
              borderRadius: 15),
          const SizedBox(
            height: 5,
          ),
          BlocBuilder<FollowBloc, FollowState>(
            builder: (context, state) {
              if (state is FollowLoading) {
                return const LoadingScreen();
              }

              if (state is FollowersLoaded) {
                List<UserModel> followers = state.showFollowersResponse.data!;
                return Expanded(
                  child: ListView.builder(
                    itemCount: followers.length,
                    itemBuilder: (context, index) {
                      UserModel follower = followers[index];
                      return GestureDetector(
                        onTap: () {
                          webSocketService.createRoom(follower.id!);
                        },
                        child: RoomCandidate(
                          user: follower,
                          size: size,
                          messageController: messageController,
                        ),
                      );
                    },
                  ),
                );
              }

              return const SizedBox();
            },
          ),
        ],
      ),
    );
  }
}
