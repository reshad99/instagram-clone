import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/data/auth/bloc/auth/auth_bloc.dart';
import 'package:instagram_clone/services/routes/nested_router.gr.dart';

class AuthGuard extends AutoRouteGuard {
  final AuthBloc authBloc;

  AuthGuard({required this.authBloc});

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    if (authBloc.state is AuthAuthenticated) {
      resolver.next(true);
    } else {
      debugPrint('else blokuna girdi');
      debugPrint(authBloc.state.toString());
      router.push(const LoginRoute());
    }
  }
}
