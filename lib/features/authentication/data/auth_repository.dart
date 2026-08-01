import 'package:dio/dio.dart';

import '../../../core/network/api_client.dart';
import '../../../core/storage/secure_storage_service.dart';
import '../domain/auth_session.dart';

class AuthRepository {
  AuthRepository(this._apiClient, this._storage);
  final ApiClient _apiClient;
  final SecureStorageService _storage;

  Future<AuthSession> signIn(String userName, String password) async {
    try {
      final tokenResponse = await _apiClient.dio.post<Object>(
        '/token_create',
        data: FormData.fromMap({
          'user_name': userName,
          'password': password,
          'remember': '1',
          'app_name': 'SNM',
        }),
      );
      final tokenData = _asMap(tokenResponse.data);
      if (tokenData['status_token'] != true) {
        throw StateError(
          _message(tokenData, 'Username atau kata sandi tidak valid.'),
        );
      }
      final tokenKey = _string(tokenData['token_key'] ?? tokenData['token']);
      if (tokenKey == null) {
        throw StateError('Respons login tidak memiliki token.');
      }

      final profileResponse = await _apiClient.dio.post<Object>(
        '/profil_user',
        data: FormData.fromMap({'user_name': userName, 'token_key': tokenKey}),
      );
      final profile = _asMap(profileResponse.data);
      final parentReference = _string(profile['serial']);
      if (parentReference == null) {
        throw StateError('Respons profil tidak memiliki serial parent.');
      }
      final session = AuthSession(
        userName: userName,
        tokenKey: tokenKey,
        parentReference: parentReference,
        displayName: _string(profile['parent_name'] ?? profile['nama']),
        schoolName: _string(profile['school_name'] ?? profile['namasekolah']),
      );
      await _storage.write('session.user_name', session.userName);
      await _storage.write('session.token_key', session.tokenKey);
      await _storage.write('session.parent_reference', session.parentReference);
      return session;
    } on DioException catch (error) {
      throw StateError(_loginErrorMessage(error));
    }
  }

  String _loginErrorMessage(DioException error) {
    final statusCode = error.response?.statusCode;
    final data = error.response?.data;
    if (data is Map) {
      final message = _string(data['message'] ?? data['error']);
      if (message != null) return message;
    }
    return switch (statusCode) {
      401 || 403 => 'Username atau kata sandi tidak valid.',
      429 => 'Terlalu banyak percobaan masuk. Coba lagi beberapa saat lagi.',
      final code? when code >= 500 =>
        'Server login sedang bermasalah. Coba lagi beberapa saat lagi.',
      _ => 'Tidak dapat terhubung ke server login. Periksa koneksi Anda.',
    };
  }

  Map<String, dynamic> _asMap(Object? value) => value is Map
      ? value.map((key, value) => MapEntry(key.toString(), value))
      : <String, dynamic>{};

  String? _string(Object? value) {
    final result = value?.toString().trim();
    return result == null || result.isEmpty ? null : result;
  }

  String _message(Map<String, dynamic> data, String fallback) =>
      _string(data['message'] ?? data['error']) ?? fallback;
}
