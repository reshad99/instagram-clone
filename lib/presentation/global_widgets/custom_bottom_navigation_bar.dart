import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/core/constants/colors.dart';
import 'package:instagram_clone/core/helpers/helpers.dart';
import 'package:instagram_clone/presentation/global_widgets/custom_bottom_navigation_bar_item.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    super.key,
    required this.tabsRouter,
  });

  final TabsRouter tabsRouter;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      elevation: 1,
      color: primaryInputColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment:
              MainAxisAlignment.spaceAround, // aligns the icons evenly
          children: <Widget>[
            CustomBottomNavigationBarItem(
              tabsRouter: tabsRouter,
              activeIcon: const Icon(Icons.home_filled, size: 30,),
              icon: const Icon(Icons.home_outlined),
              index: 0,
            ),
            CustomBottomNavigationBarItem(
                tabsRouter: tabsRouter,
                activeIcon: Image.asset(iconsPath('search.png')),
                icon: const Icon(Icons.search_outlined),
                index: 1),
            CustomBottomNavigationBarItem(
                tabsRouter: tabsRouter,
                activeIcon: const Icon(Icons.add_a_photo, size: 30),
                icon: const Icon(Icons.add_a_photo_outlined,),
                index: 2),
            CustomBottomNavigationBarItem(
                tabsRouter: tabsRouter,
                activeIcon: const Icon(Icons.favorite, size: 30,),
                icon: const Icon(Icons.favorite_border),
                index: 3),
            IconButton(
                onPressed: () {
                  tabsRouter.setActiveIndex(4);
                },
                icon: Container(
                    decoration: const BoxDecoration(shape: BoxShape.circle),
                    child: Image.asset(photosPath('story-1.png'))))
          ],
        ),
      ),
    );
  }
}
