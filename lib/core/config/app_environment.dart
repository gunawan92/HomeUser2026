enum AppEnvironment { development, staging, production }

extension AppEnvironmentX on AppEnvironment {
  static AppEnvironment fromValue(String value) => switch (value) {
    'production' => AppEnvironment.production,
    'staging' => AppEnvironment.staging,
    _ => AppEnvironment.development,
  };
}
