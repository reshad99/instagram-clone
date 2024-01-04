import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/presentation/global_widgets/error_screen.dart';
import 'package:instagram_clone/presentation/pages/home/widgets/story_view.dart';

class RouteGenerator {
  static Route<dynamic>? generate(RouteSettings settings) {
    switch (settings.name) {


      default:
        return _buildRoute(
          const ErrorScreen(),
        );
    }
  }

  static Route<dynamic> _buildRoute(Widget page) {
    return _isIOSPlatform()
        ? CupertinoPageRoute(builder: (_) => page)
        : MaterialPageRoute(builder: (_) => page);
  }

  static bool _isIOSPlatform() {
    return defaultTargetPlatform == TargetPlatform.iOS;
  }
}
