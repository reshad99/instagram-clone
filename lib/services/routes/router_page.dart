import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/core/constants/colors.dart';
import 'package:instagram_clone/services/routes/nested_router.gr.dart';

@RoutePage()
class RouterPage extends StatelessWidget {
  const RouterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: const [
        HomeRoute(),
        SearchRoute(),
        HeartRoute(),
        ProfileRoute()
      ],
      bottomNavigationBuilder: (context, tabsRouter) {
        return CustomBottomNavBar(tabsRouter: tabsRouter,);
      },
    );
  }
}

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    super.key, required this.tabsRouter,
  });

  final TabsRouter tabsRouter;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: primaryGreyColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround, // aligns the icons evenly
          children: <Widget>[
            IconButton(
              icon: Icon(
                tabsRouter.activeIndex == 0 ? Icons.home_filled : Icons.home_outlined,
                color: tabsRouter.activeIndex == 0 ? primaryBlackColor : Colors.black
              ),
              onPressed: () => tabsRouter.setActiveIndex(0),
            ),
            IconButton(
              icon: Icon(
                tabsRouter.activeIndex == 1 ? Icons.search_rounded : Icons.search_outlined,
                color: tabsRouter.activeIndex == 1 ? primaryBlackColor : Colors.black
              ),
              onPressed: () => tabsRouter.setActiveIndex(1),
            ),
            IconButton(
              icon: Icon(Icons.add_box_outlined, color: Colors.black),
              onPressed: () => tabsRouter.setActiveIndex(2),
            ),
            IconButton(
              icon: Icon(
                tabsRouter.activeIndex == 3 ? Icons.favorite : Icons.favorite_border,
                color: tabsRouter.activeIndex == 3 ? primaryBlackColor : Colors.black
              ),
              onPressed: () => tabsRouter.setActiveIndex(3),
            ),
            IconButton(
              icon: Icon(
                tabsRouter.activeIndex == 4 ? Icons.photo : Icons.photo_outlined,
                color: tabsRouter.activeIndex == 4 ? primaryBlackColor : Colors.black
              ),
              onPressed: () => tabsRouter.setActiveIndex(4),
            ),
          ],
        ),
      ),
    );
  }
}
