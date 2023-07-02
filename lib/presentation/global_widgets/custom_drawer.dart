// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:instagram_clone/core/constants/colors.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({
    Key? key,
    required this.scaffoldBody,
    required this.navBar,
  }) : super(key: key);
  final Widget scaffoldBody;
  final Widget navBar;

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragUpdate: (details) {
        setState(() {
          xOffset -= details.delta.dx; // subtract the drag distance
          xOffset = xOffset > 0 ? 0 : xOffset; // change the conditions
          xOffset = xOffset < -250 ? -250 : xOffset; // change the conditions
        });
      },
      onHorizontalDragEnd: (details) {
        // Add this
        setState(() {
          if (details.velocity.pixelsPerSecond.dx > 0) {
            xOffset = 0;
          } else {
            xOffset = -250;
          }
        });
      },
      child: Stack(
        children: [
          AnimatedContainer(
            transform: Matrix4.translationValues(xOffset, yOffset, 0)
              ..scale(scaleFactor),
            duration: const Duration(milliseconds: 250),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(xOffset != 0 ? 30 : 0.0),
            ),
            child: Scaffold(
              backgroundColor: primaryInputColor,
              appBar: AppBar(
                actions: [
                  IconButton(
                      icon: Icon(Icons.menu),
                      onPressed: () {
                        setState(() {
                          xOffset = xOffset == 0
                              ? -250
                              : 0; // change the condition to negative
                        });
                      }),
                ],
              ),
              body: widget.scaffoldBody,
            ),
          ),
          AnimatedPositioned(
              duration: Duration(milliseconds: 250),
              right: xOffset == 0 ? -250 : 0, // change from left to right
              top: 0,
              bottom: 0,
              width: 250,
              child: widget.navBar),
        ],
      ),
    );
  }
}
