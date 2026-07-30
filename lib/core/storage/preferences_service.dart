import 'package:shared_preferences/shared_preferences.dart';

class PreferencesService {
  PreferencesService(this._preferences);
  final SharedPreferences _preferences;

  bool? getBool(String key) => _preferences.getBool(key);
  Future<void> setBool(String key, bool value) async =>
      _preferences.setBool(key, value);
}
