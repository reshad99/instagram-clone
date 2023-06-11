import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instagram_clone/data/auth/bloc/auth/auth_bloc.dart';
import 'package:instagram_clone/presentation/pages/auth/intro_screen.dart';
import 'package:instagram_clone/services/router.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Instagram clone',
      onGenerateRoute: (settings) => RouteGenerator.generate(settings),
      theme: ThemeData(
          appBarTheme: const AppBarTheme(
        centerTitle: true,
      )),
      home: Builder(
        builder: (context) {
          return ScreenUtilInit(
            builder: (context, child) {
              return IntroScreen();
            },
          );
        },
      ),
    );
  }
}
