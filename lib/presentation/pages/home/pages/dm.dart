import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class DMScreen extends StatelessWidget {
  const DMScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(child: Text('dm screen')),
    );
  }
}
