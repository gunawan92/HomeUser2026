import 'package:dio/dio.dart';

import '../config/app_config.dart';

class ApiClient {
  ApiClient({String? baseUrl})
    : dio = Dio(
        BaseOptions(
          baseUrl: baseUrl ?? AppConfig.apiBaseUrl,
          connectTimeout: const Duration(seconds: 15),
          receiveTimeout: const Duration(seconds: 20),
          sendTimeout: const Duration(seconds: 20),
          responseType: ResponseType.json,
        ),
      );

  final Dio dio;
}
