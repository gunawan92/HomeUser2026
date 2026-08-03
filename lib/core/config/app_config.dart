import 'app_environment.dart';

abstract final class AppConfig {
  static const _environmentValue = String.fromEnvironment(
    'APP_ENV',
    defaultValue: 'development',
  );
  static const apiBaseUrl = String.fromEnvironment(
    'API_BASE_URL',
    defaultValue: 'https://devhu.stela.id',
  );
  static AppEnvironment get environment =>
      AppEnvironmentX.fromValue(_environmentValue);
}
