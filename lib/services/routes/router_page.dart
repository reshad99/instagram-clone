import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/presentation/global_widgets/custom_bottom_navigation_bar.dart';
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
        AddPostRoute(),
        HeartRoute(),
        ProfileRoute()
      ],
      bottomNavigationBuilder: (context, tabsRouter) {
        return CustomBottomNavBar(
          tabsRouter: tabsRouter,
        );
      },
    );
  }
}
