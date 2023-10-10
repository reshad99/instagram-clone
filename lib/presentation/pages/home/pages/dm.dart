import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/core/constants/colors.dart';
import 'package:instagram_clone/core/helpers/data.dart';
import 'package:instagram_clone/presentation/global_widgets/custom_textfiedl.dart';
import 'package:instagram_clone/presentation/pages/home/widgets/story_widget.dart';

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
              onPressed: () {},
              icon: const Icon(
                Icons.add,
                color: primaryBlackColor,
                size: 30,
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
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
            SliverList.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                var msg = messages[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Row(
                    children: [
                      StoryWidget(radius: 70, photo: msg['photo']),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'joshua_l',
                            style: TextStyle(fontSize: 20),
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 200,
                                child: Text(
                                  msg['message'],
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
                                      fontSize: 20, color: primaryGreyColor),
                                  children: [
                                    const WidgetSpan(
                                        child: Padding(
                                      padding: EdgeInsets.only(bottom: 5),
                                      child: Text('.'),
                                    )),
                                    TextSpan(text: ' ${msg['timeDiff']}')
                                  ]))
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
