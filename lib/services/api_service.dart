import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ApiService{
  final _dio = Dio();

  ApiService(){
    _dio.options.baseUrl = '';
    _dio.interceptors.add(PrettyDioLogger());
  }

  get sendRequest => _dio;

}