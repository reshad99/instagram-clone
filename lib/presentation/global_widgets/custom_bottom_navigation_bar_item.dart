import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/core/constants/colors.dart';

class CustomBottomNavigationBarItem extends StatelessWidget {
  const CustomBottomNavigationBarItem({
    super.key,
    required this.tabsRouter,
    required this.activeIcon,
    required this.icon,
    required this.index,
  });

  final TabsRouter tabsRouter;
  final Widget activeIcon;
  final Widget icon;
  final Color color = primaryBlackColor;
  final Color activeColor = primaryBlackColor;
  final int index;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: tabsRouter.activeIndex == index ? activeIcon : icon,
      onPressed: () => tabsRouter.setActiveIndex(index),
    );
  }
}
