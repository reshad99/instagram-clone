import 'package:flutter/material.dart';
import 'package:instagram_clone/bloc_provider.dart';
import 'package:instagram_clone/init.dart';

void main() async {
  await init();
  return runApp(BlocProviderInit().init());
}
