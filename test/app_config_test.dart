import 'package:bigstela/core/config/app_config.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('development is the default environment', () {
    expect(AppConfig.environment.name, 'development');
  });

  test('default LAN API host is centralized', () {
    expect(AppConfig.apiBaseUrl, 'http://192.168.1.71:8081');
  });
}
