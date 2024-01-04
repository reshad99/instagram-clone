import 'package:dio/dio.dart';
import 'package:instagram_clone/services/api/api_service.dart';
import 'package:instagram_clone/services/local_database/local_database.dart';
import 'package:instagram_clone/services/locator.dart';

mixin Authentication {
  final localDB = locator<LocalDatabase>();
  final apiService = ApiService();
  String? get token {
    return localDB.get('token');
  }

  Options addOptions(String token) {
    return Options(headers: {'Authorization': 'Bearer $token'});
  }
}
