import 'package:dio/dio.dart';
import 'package:instagram_clone/services/local_database/local_database.dart';
import 'package:instagram_clone/services/locator.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ApiService {
  final _dio = Dio();
  final localDB = locator<LocalDatabase>();

  ApiService() {
    _dio.options.baseUrl = 'https://instagram.bakudevs.com/api/customer/v1';
    _dio.options.headers = {
      "Accept": "application/json",
      "Accept-Language": "az",
    };
    _dio.options.validateStatus = (statusCode) {
      if (statusCode == null) {
        return false;
      }

      return statusCode >= 200 && statusCode < 500;
    };
    // _dio.interceptors.add(PrettyDioLogger());
  }

  Dio get sendRequest => _dio;
}
