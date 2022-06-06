import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';

class ApiConstants {
  static const String kBaseUrl = "https://api.sinaxys.com/v1/";

  static Options kOptions = buildCacheOptions(const Duration(hours: 1));

  static const Map<String, dynamic> kQueryParameters = {};
}
