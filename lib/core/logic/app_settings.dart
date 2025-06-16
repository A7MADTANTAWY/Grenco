import 'package:shared_preferences/shared_preferences.dart';

class AppSettings {
  static const String _loginKey = 'isLoggedIn';
  static const String _firstTimeKey = 'isFirstTime';
  static const String _themeKey = "isDarkMode";

  // حفظ الوضع الحالي (true لو dark mode، false لو light mode)
  static Future<void> setDarkMode(bool isDarkMode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_themeKey, isDarkMode);
  }

  // استرجاع الوضع الحالي، القيمة الافتراضية false (يعني light mode)
  static Future<bool> getDarkMode() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_themeKey) ?? false;
  }

  // حفظ حالة الدخول
  static Future<void> setLoginStatus(bool isLoggedIn) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_loginKey, isLoggedIn);
  }

  // استرجاع حالة الدخول مع قيمة افتراضية
  static Future<bool> getLoginStatus() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_loginKey) ?? false; // القيمة الافتراضية: false
  }

  // حفظ ما إذا كان أول مرة يدخل فيها المستخدم
  static Future<void> setFirstTimeStatus(bool isFirstTime) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_firstTimeKey, isFirstTime);
  }

  // استرجاع ما إذا كان أول مرة يدخل فيها المستخدم مع قيمة افتراضية
  static Future<bool> getFirstTimeStatus() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_firstTimeKey) ?? true; // القيمة الافتراضية: true
  }

  // مسح جميع التفضيلات
  static Future<void> clearSettings() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_loginKey);
    await prefs.remove(_firstTimeKey);
  }
}
