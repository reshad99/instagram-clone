import 'package:flutter/material.dart';

class DebugErrorScreen extends StatelessWidget {
  const DebugErrorScreen({super.key, required this.errorMessage});
  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(errorMessage),
      ),
    );
  }
}
