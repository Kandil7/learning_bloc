import 'package:shared_preferences/shared_preferences.dart';

class ThemeCached{
  static setThemeIndexCached(int theme) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('themeIndex', theme);
  }
  static getThemeIndexCached() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt('themeIndex')??0;
  }
}