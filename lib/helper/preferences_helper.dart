import 'package:shared_preferences/shared_preferences.dart';
import 'package:shoe_size/utils/app_constants.dart';

class PreferenceHelper {
  static late final SharedPreferences _prefs;
  static final Map<dynamic, dynamic> _storedPrefs = {};

  static Future<SharedPreferences> load() async {
    _prefs = await SharedPreferences.getInstance();
    return _prefs;
  }

  static void setString(String key, String value) {
    _prefs.setString(key, value);
    _storedPrefs[key] = value;
  }

  static void setInt(String key, int value) {
    _prefs.setInt(key, value);
    _storedPrefs[key] = value;
  }

  static void setDouble(String key, double value) {
    _prefs.setDouble(key, value);
    _storedPrefs[key] = value;
  }

  static void setBool(String key, bool value) {
    _prefs.setBool(key, value);
    _storedPrefs[key] = value;
  }

  static String? getString(String key) =>
      _storedPrefs[key] ?? _prefs.getString(key);

  static int? getInt(String key) => _storedPrefs[key] ?? _prefs.getInt(key);

  static double? getDouble(String key) =>
      _storedPrefs[key] ?? _prefs.getDouble(key);

  static bool? getBool(String key) => _storedPrefs[key] ?? _prefs.getBool(key);

  static Future<void> clearData() async {
    _prefs.remove(AppConstants.prefKeyLanguageCode);

    // Clear values from _storedPrefs
    _storedPrefs.clear();

    // Clear all data in SharedPreferences
    await _prefs.clear();
  }
}
