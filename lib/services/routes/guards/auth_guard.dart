import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/data/auth/bloc/auth/auth_bloc.dart';
import 'package:instagram_clone/presentation/global_screens/error.dart';
import 'package:instagram_clone/services/routes/nested_router.gr.dart';

import 'dart:async';

class AuthGuard extends AutoRouteGuard {
  final AuthBloc authBloc;

  AuthGuard({required this.authBloc});

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    // if (authBloc.state is AuthAuthenticated) {
    //   resolver.next(true);
    // } else if (authBloc.state is AuthUnauthenticated) {
    //   router.push(const LoginRoute());
    //   resolver.next(false);
    // } else {
    //   router.pushWidget(const LoadingScreen());
    // }

    // Using a Completer to wait for the first state that comes through the stream.
    final Completer<AuthState> stateCompleter = Completer<AuthState>();

    // Listen for the first event in the stream.
    final StreamSubscription<AuthState> subscription = authBloc.stream.listen(
      (state) {
        // If the completer hasn't completed yet, we'll complete it with the first state.
        if (!stateCompleter.isCompleted) {
          stateCompleter.complete(state);
        }
      },
    );

    // Once we have a state, we can proceed.
    stateCompleter.future.then((currentState) {
      debugPrint('$currentState');
      if (currentState is AuthAuthenticated) {
        // If the user is authenticated, proceed with navigation
        resolver.next(true);
      } else if (currentState is AuthUnauthenticated) {
        // If not authenticated, redirect to the login route
        router.push(const LoginRoute());
        resolver.next(false); // Do not proceed with the original navigation
      } else if (currentState is AuthError) {

        // For any other state, you might want to show a loading indicator
        // or handle accordingly
        router.pushWidget(DebugErrorScreen(
          errorMessage: currentState.errorResponse.message!,
        ));

        resolver.next(false); // Do not proceed with the original navigation
      }

      // Cancel the subscription after we're done with it to avoid memory leaks.
      subscription.cancel();
    }).catchError((error) {
      // If there's an error, we need to handle it.
      debugPrint('Error: $error');
      resolver.next(false);
      subscription.cancel();
    });

    // Additionally, we should check the immediate state before waiting for stream updates.
    if (authBloc.state is AuthAuthenticated) {
      resolver.next(true);
    } else if (authBloc.state is AuthUnauthenticated) {
      router.push(const LoginRoute());
      resolver.next(false);
    }
  }
}
