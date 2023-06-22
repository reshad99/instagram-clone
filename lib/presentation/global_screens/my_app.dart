import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instagram_clone/core/constants/colors.dart';
import 'package:instagram_clone/services/routes/nested_router.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    NestedRouter nestedRouter = NestedRouter();
    return ScreenUtilInit(
      designSize: const Size(360, 800),
        builder: (context, child) => MaterialApp.router(
              debugShowCheckedModeBanner: false,
              title: 'Instagram clone',
              theme: ThemeData(
                  appBarTheme: const AppBarTheme(
                      centerTitle: true,
                      elevation: 0,
                      color: Colors.transparent,
                      iconTheme:
                          IconThemeData(color: primaryBlackColor, size: 28))),
              routerConfig: nestedRouter.config(),
            ));
  }
}
