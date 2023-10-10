import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram_clone/data/auth/bloc/auth/auth_bloc.dart';
import 'package:instagram_clone/presentation/global_widgets/custom_bottom_navigation_bar.dart';
import 'package:instagram_clone/services/routes/nested_router.gr.dart';

@RoutePage()
class RouterPage extends StatelessWidget {
  const RouterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      bloc: context.read<AuthBloc>(),
      builder: (context, state) {
        if (state is AuthUnauthenticated) {
          context.replaceRoute(const LoginRoute());
        }
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
      },
    );
  }
}
