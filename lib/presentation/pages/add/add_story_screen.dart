import 'dart:io';
import 'dart:ui';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagram_clone/core/constants/colors.dart';
import 'package:instagram_clone/core/helpers/style.dart';
import 'package:instagram_clone/data/home/bloc/status/status_bloc.dart';
import 'package:instagram_clone/data/home/request/add_story_request.dart';
import 'package:instagram_clone/services/routes/nested_router.gr.dart';

@RoutePage()
class AddStoryScreen extends StatefulWidget {
  const AddStoryScreen({super.key, required this.file});
  final XFile file;

  @override
  State<AddStoryScreen> createState() => _AddStoryScreenState();
}

class _AddStoryScreenState extends State<AddStoryScreen> {
  late TextEditingController textEditingController;
  late TextEditingController feedbackTextEditingController;
  late FocusNode _focusNode;
  late StatusBloc statusBloc;
  Offset? textPosition;
  double width = 200.0; // initial width
  double height = 200.0; // initial height
  late bool hasTextField;

  @override
  void initState() {
    super.initState();
    statusBloc = context.read<StatusBloc>();
    hasTextField = true;
    _focusNode = FocusNode();
    textEditingController = TextEditingController();
    feedbackTextEditingController = TextEditingController();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    File file = File(widget.file.path);

    // Set the initial position to be the center of the screen
    textPosition ??= Offset(
      (size.width - width) / 2, // center the widget horizontally
      (size.height - height) / 2, // center the widget vertically
    );

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: primaryBlackColor,
      body: Stack(
        children: [
          SizedBox(
            width: size.width,
            height: size.height,
            child: Image.file(file, fit: BoxFit.contain),
          ),
          Positioned(
            left: textPosition!.dx,
            top: textPosition!.dy,
            child: GestureDetector(
              child: ResizableBox(
                initialWidth: width,
                initialHeight: height,
                child: Draggable(
                  feedback: feedBackChild(),
                  childWhenDragging: SizedBox(
                    width: width,
                    height: height,
                  ),
                  child: dragChild(),
                  onDragEnd: (drag) {
                    setState(() {
                      textPosition = drag.offset;
                    });
                  },
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          statusBloc.add(AddStoryEvent(
              addStoryRequest: AddStoryRequest(
                  media: widget.file,
                  position: {"dx": textPosition!.dx, "dy": textPosition!.dy},
                  text: textEditingController.text)));
          context.navigateTo(const HomeRoute());
        },
        child: const Icon(Icons.send),
      ),
    );
  }

  Widget dragChild() {
    return Material(
      type: MaterialType.transparency,
      child: SizedBox(
        width: width,
        height: height,
        child: mainTextField(),
      ),
    );
  }

  Widget feedBackChild() {
    return Material(
      type: MaterialType.transparency,
      child: SizedBox(
        width: width,
        height: height,
        child: feedBackTextField(),
      ),
    );
  }

  TextField mainTextField() {
    return TextField(
      keyboardType: TextInputType.text,
      onSubmitted: (value) {
        textEditingController.text = value;
        feedbackTextEditingController.text = value;
      },
      maxLines: 9,
      minLines: 1,
      style: AppStyles.addStoryTextFieldStyle,
      focusNode: _focusNode,
      controller: textEditingController,
      decoration: InputDecoration(
        hintText: 'Add a description',
        hintStyle: AppStyles.addStoryTextFieldStyle,
        border: const OutlineInputBorder(borderSide: BorderSide.none),
      ),
    );
  }

  ValueListenableBuilder feedBackTextField() {
    return ValueListenableBuilder(
      valueListenable: textEditingController,
      builder: (context, value, child) => TextField(
        controller: textEditingController,
        maxLines: 9,
        minLines: 1,
        canRequestFocus: false,
        style: AppStyles.addStoryTextFieldStyle,
        focusNode: _focusNode,
        decoration: InputDecoration(
          hintText: 'Add a description',
          hintStyle: AppStyles.addStoryTextFieldStyle,
          border: const OutlineInputBorder(borderSide: BorderSide.none),
        ),
      ),
    );
  }
}

class ResizableBox extends StatefulWidget {
  final Widget child;
  final double initialWidth;
  final double initialHeight;

  ResizableBox({
    required this.child,
    required this.initialWidth,
    required this.initialHeight,
  });

  @override
  _ResizableBoxState createState() => _ResizableBoxState();
}

class _ResizableBoxState extends State<ResizableBox> {
  double width = 0.0;
  double height = 0.0;

  @override
  void initState() {
    super.initState();
    width = widget.initialWidth;
    height = widget.initialHeight;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onScaleUpdate: (details) {
        setState(() {
          width *= details.scale;
          height *= details.scale;
        });
      },
      child: SizedBox(
        width: width,
        height: height,
        child: widget.child,
      ),
    );
  }
}
