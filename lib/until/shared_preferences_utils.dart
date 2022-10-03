import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesUtils {
  static late final SharedPreferences _prefsInstance;
  static Future<SharedPreferences> get _instance async => _prefsInstance;

  static Future<SharedPreferences?> init() async {
    _prefsInstance = await SharedPreferences.getInstance();
    return _prefsInstance;
  }

  static String getString(String key) {
    return _prefsInstance.getString(key) ?? "";
  }

  static Future<bool> setString(String key, String value) async {
    var prefs = await _instance;
    return prefs.setString(key, value);
  }

  static int getInt(String key, int defValue) {
    return _prefsInstance.getInt(key) ?? 0;
  }

  static Future<bool> setInt(String key, int value) async {
    var prefs = await _instance;
    return prefs.setInt(key, value);
  }

  static bool? getBool(String key) {
    return _prefsInstance.getBool(key) ?? false;
  }

  static Future<bool> setBool(String key, bool value) async {
    var prefs = await _instance;
    return prefs.setBool(key, value);
  }
}
