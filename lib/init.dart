import 'package:flutter/material.dart';
import 'package:instagram_clone/services/local_database/hive.dart';
import 'package:instagram_clone/services/local_database/local_database.dart';
import 'package:instagram_clone/services/locator.dart';

Future<void> init() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setUpLocator();
  await locator<LocalDatabase>().init('cache');
}
