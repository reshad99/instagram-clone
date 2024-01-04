import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/core/constants/colors.dart';
import 'package:instagram_clone/core/helpers/style.dart';
import 'package:instagram_clone/data/home/model/status.dart';
import 'package:instagram_clone/data/home/model/story.dart';
import 'package:instagram_clone/presentation/pages/home/widgets/profile_photo_widget.dart';
import 'package:story_view/story_view.dart';

@RoutePage()
class StoryViewScreen extends StatefulWidget {
  const StoryViewScreen(
      {super.key, required this.statuses, required this.index});
  final List<Status> statuses;
  final int index;

  @override
  State<StoryViewScreen> createState() => _StoryViewScreenState();
}

class _StoryViewScreenState extends State<StoryViewScreen> {
  late StoryController storyController;
  late List<StoryItem> storyItems = [];
  late PageController pageController;
  late ValueNotifier<StoryItem> currentStoryItemNotifier;
  late ValueNotifier<int> currentPageNotifier;
  late TextEditingController textEditingController;

  @override
  void initState() {
    super.initState();
    storyController = StoryController();
    textEditingController = TextEditingController();
    pageController = PageController(initialPage: widget.index);
    initStoryItems();
    currentStoryItemNotifier = ValueNotifier(storyItems.first);
    currentPageNotifier = ValueNotifier(widget.index);
  }

  @override
  void dispose() {
    storyController.dispose();
    pageController.dispose();
    currentStoryItemNotifier.dispose();
    super.dispose();
  }

  void initStoryItems() {
    for (var story in widget.statuses[widget.index].stories!) {
      storyItems.add(StoryItem.pageImage(
          story: story, url: story.media!.path!, controller: storyController));
    }
  }

  void updateStoryItems(int page) {
    List<StoryItem> newStoryItems = [];

    for (var story in widget.statuses[page].stories!) {
      newStoryItems.add(StoryItem.pageImage(
          story: story, url: story.media!.path!, controller: storyController));
    }

    storyItems = newStoryItems;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: pageController,
        itemCount: widget.statuses.length,
        onPageChanged: (page) {
          currentPageNotifier.value = page;
          updateStoryItems(page);
        },
        itemBuilder: (context, index) {
          return ValueListenableBuilder<int>(
            valueListenable: currentPageNotifier,
            builder: (context, currentPage, child) {
              Status status = widget.statuses[currentPage];

              return ValueListenableBuilder<StoryItem>(
                valueListenable: currentStoryItemNotifier,
                builder: (context, currentStory, child) {
                  return Stack(
                    children: [
                      storyView(context, currentPage),
                      storyInfo(status, currentStory.story),
                      storyText(currentStory)
                    ],
                  );
                },
              );
            },
          );
        },
      ),
    );
  }

  Positioned storyText(StoryItem currentStory) {
    return Positioned(
        top: currentStory.story.position!.dy!.toDouble(),
        left: currentStory.story.position!.dx!.toDouble(),
        child: SizedBox(
          width: 200,
          height: 200,
          child: TextFormField(
            controller: textEditingController,
            maxLines: 9,
            minLines: 1,
            showCursor: false,
            autofocus: false,
            cursorHeight: 0,
            cursorOpacityAnimates: false,
            enableInteractiveSelection: false,
            canRequestFocus: false,
            style: AppStyles.addStoryTextFieldStyle,
            decoration: InputDecoration(
              hintText: currentStory.story.text,
              border: const OutlineInputBorder(borderSide: BorderSide.none),
            ),
          ),
        ));
  }

  StoryView storyView(BuildContext context, int currentPage) {
    return StoryView(
      storyItems: storyItems,
      controller: storyController,
      onStoryShow: (storyItem) {
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          if (mounted) {
            currentStoryItemNotifier.value = storyItem;
            textEditingController.text = storyItem.story.text ?? '';
          }
        });
      },
      onComplete: () {
        if (currentPage < widget.statuses.length - 1) {
          pageController.animateToPage(currentPage + 1,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut);
        } else {
          context.popRoute();
        }
      },
    );
  }

  Positioned storyInfo(Status status, Story story) {
    return Positioned(
        top: 50,
        left: 10,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ProfilePhotoWidget(radius: 30, photo: status.customer!.image, isMe: true,),
            const SizedBox(
              width: 5,
            ),
            Text(
              story.time!,
              style: const TextStyle(color: primaryGreyColor, fontSize: 12),
            )
          ],
        ));
  }
}
