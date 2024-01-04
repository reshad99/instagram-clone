import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram_clone/core/constants/colors.dart';
import 'package:instagram_clone/data/message/bloc/room/room_bloc.dart';
import 'package:instagram_clone/data/message/model/room.dart';
import 'package:instagram_clone/presentation/global_screens/loading.dart';
import 'package:instagram_clone/presentation/global_widgets/custom_textfiedl.dart';
import 'package:instagram_clone/presentation/pages/home/widgets/room_widget.dart';
import 'package:instagram_clone/services/response/error_handler.dart';
import 'package:instagram_clone/services/routes/nested_router.gr.dart';

@RoutePage()
class DMScreen extends StatefulWidget {
  const DMScreen({super.key});

  @override
  State<DMScreen> createState() => _DMScreenState();
}

class _DMScreenState extends State<DMScreen> {
  late TextEditingController searchController;

  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: greyAppBarColor,
        leading: const BackButton(),
        actions: [
          IconButton(
              onPressed: () {
                context.navigateTo(const CreateRoomRoute());
              },
              icon: const Icon(
                Icons.add,
                color: primaryBlackColor,
                size: 30,
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: RefreshIndicator(
          onRefresh: () async {
            context.read<RoomBloc>().add(FetchRooms());
          },
          child: CustomScrollView(
            slivers: <Widget>[
              SliverList(
                  delegate: SliverChildListDelegate([
                CustomTextField(
                    borderRadius: 20,
                    prefixIcon: const Icon(Icons.search),
                    size: size,
                    controller: searchController,
                    hint: 'Search'),
              ])),
              BlocBuilder<RoomBloc, RoomState>(
                builder: (context, state) {
                  if (state is RoomsError) {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      ErrorHandler.showError(context, state.errorResponse);
                    });
                  }

                  if (state is RoomsLoading) {
                    return SliverToBoxAdapter(
                        child: Padding(
                            padding: EdgeInsets.only(top: size.height / 3),
                            child: const LoadingScreen()));
                  }

                  if (state is RoomsLoaded) {
                    return SliverList.builder(
                      itemCount: state.rooms.length,
                      itemBuilder: (context, index) {
                        Room room = state.rooms[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: RoomWidget(room: room),
                        );
                      },
                    );
                  }
                  return const SliverToBoxAdapter(child: SizedBox());
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
