import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

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
      ) {
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          if (kDebugMode) {
            final prettyBody = _prettyPrint(options.data);
            debugPrint(
              '========== [STELA API REQUEST] ==========\n'
              '${options.method} ${options.uri}\n'
              'Headers: ${options.headers}\n'
              'Body: $prettyBody\n'
              '=========================================',
            );
          }
          handler.next(options);
        },
        onResponse: (response, handler) {
          if (kDebugMode) {
            final prettyBody = _prettyPrint(response.data);
            debugPrint(
              '========== [STELA API RESPONSE ${response.statusCode}] ==========\n'
              '${response.requestOptions.method} ${response.requestOptions.uri}\n'
              'Response Body:\n$prettyBody\n'
              '==================================================',
            );
          }
          handler.next(response);
        },
        onError: (error, handler) {
          if (kDebugMode) {
            final response = error.response;
            final prettyBody = _prettyPrint(response?.data);
            debugPrint(
              '========== [STELA API ERROR ${response?.statusCode ?? "NO STATUS"}] ==========\n'
              '${error.requestOptions.method} ${error.requestOptions.uri}\n'
              'Error Type: ${error.type}\n'
              'Error Message: ${error.message}\n'
              'Response Body:\n$prettyBody\n'
              '==============================================================',
            );
          }
          handler.next(error);
        },
      ),
    );
  }

  final Dio dio;

  static String _prettyPrint(Object? data) {
    if (data == null) return '<null>';
    try {
      if (data is Map || data is List) {
        return const JsonEncoder.withIndent('  ').convert(data);
      }
      if (data is String) {
        final decoded = jsonDecode(data);
        return const JsonEncoder.withIndent('  ').convert(decoded);
      }
    } catch (_) {}
    return data.toString();
  }
}
