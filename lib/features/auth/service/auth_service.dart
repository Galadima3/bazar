import "package:shared_preferences/shared_preferences.dart";

class AuthService {
  static const String _authKey = "logged_in";

  static Future<bool> checkUserAuthStatus() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_authKey) ?? false;
  }

  static Future<void> setUserAuthstatus() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool(_authKey, true);
  }
}
