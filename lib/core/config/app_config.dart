import 'package:shared_preferences/shared_preferences.dart';

/// Application configuration class
/// 
/// This class is responsible for initializing and managing application-wide configuration.
/// It provides access to shared preferences and other configuration settings.
class AppConfig {
  /// Shared preferences instance
  static late SharedPreferences _prefs;
  
  /// Initialize the application configuration
  /// 
  /// This method should be called before the application starts.
  /// It initializes shared preferences and other configuration settings.
  static Future<void> initialize() async {
    _prefs = await SharedPreferences.getInstance();
  }
  
  /// Get the shared preferences instance
  static SharedPreferences get prefs => _prefs;
  
  /// Get a boolean value from shared preferences
  /// 
  /// If the key does not exist, returns the default value.
  static bool getBool(String key, {bool defaultValue = false}) {
    return _prefs.getBool(key) ?? defaultValue;
  }
  
  /// Set a boolean value in shared preferences
  static Future<bool> setBool(String key, bool value) {
    return _prefs.setBool(key, value);
  }
  
  /// Get a string value from shared preferences
  /// 
  /// If the key does not exist, returns the default value.
  static String getString(String key, {String defaultValue = ''}) {
    return _prefs.getString(key) ?? defaultValue;
  }
  
  /// Set a string value in shared preferences
  static Future<bool> setString(String key, String value) {
    return _prefs.setString(key, value);
  }
  
  /// Get an integer value from shared preferences
  /// 
  /// If the key does not exist, returns the default value.
  static int getInt(String key, {int defaultValue = 0}) {
    return _prefs.getInt(key) ?? defaultValue;
  }
  
  /// Set an integer value in shared preferences
  static Future<bool> setInt(String key, int value) {
    return _prefs.setInt(key, value);
  }
  
  /// Clear all shared preferences
  static Future<bool> clear() {
    return _prefs.clear();
  }
}
