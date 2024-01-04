
import 'package:get_it/get_it.dart';
import 'package:instagram_clone/services/local_database/hive.dart';
import 'package:instagram_clone/services/local_database/local_database.dart';

final locator = GetIt.instance;

Future<void> setUpLocator() async {
  locator.registerSingleton<LocalDatabase>(HiveService());

}
