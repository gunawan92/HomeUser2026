import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../../core/network/api_client.dart';
import '../../../core/storage/secure_storage_service.dart';
import '../data/auth_repository.dart';
import '../domain/auth_session.dart';

final secureStorageProvider = Provider<SecureStorageService>(
  (ref) => SecureStorageService(const FlutterSecureStorage()),
);
final apiClientProvider = Provider<ApiClient>((ref) => ApiClient());
final authRepositoryProvider = Provider<AuthRepository>(
  (ref) => AuthRepository(
    ref.read(apiClientProvider),
    ref.read(secureStorageProvider),
  ),
);
final authControllerProvider =
    AsyncNotifierProvider<AuthController, AuthSession?>(AuthController.new);
final authSessionProvider = Provider<AuthSession?>(
  (ref) => ref.watch(authControllerProvider).valueOrNull,
);

class AuthController extends AsyncNotifier<AuthSession?> {
  @override
  Future<AuthSession?> build() async {
    final storage = ref.read(secureStorageProvider);
    final userName = await storage.read('session.user_name');
    final tokenKey = await storage.read('session.token_key');
    final parentReference = await storage.read('session.parent_reference');
    if (userName == null || tokenKey == null || parentReference == null) {
      return null;
    }
    return AuthSession(
      userName: userName,
      tokenKey: tokenKey,
      parentReference: parentReference,
    );
  }

  Future<void> signIn(String userName, String password) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => ref.read(authRepositoryProvider).signIn(userName, password),
    );
  }

  Future<void> signOut() async {
    await ref.read(secureStorageProvider).clearAll();
    state = const AsyncData(null);
  }
}
