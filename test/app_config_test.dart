import 'package:bigstela/core/config/app_config.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('development is the default environment', () {
    expect(AppConfig.environment.name, 'development');
  });

  test('default staging API host is centralized', () {
    expect(AppConfig.apiBaseUrl, 'https://dev.stela.id');
  });
}
