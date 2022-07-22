import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService extends ChangeNotifier {
  late SharedPreferences prefs;

  Map<String, String> local = {
    "token": "",
    "refreshToken": "",
  };

  LocalStorageService() {
    _startPreferences();
  }

  Future<void> _startPreferences() async {
    prefs = await SharedPreferences.getInstance();
    await _readLocale();
  }

  _readLocale() {
    local = {
      "token": prefs.getString("token") ?? "",
      "refreshToken": prefs.getString("refreshToken") ?? "",
    };
    notifyListeners();
  }

  setString(String name, String value) async {
    await prefs.setString(name, value);
    await _readLocale();
  }
}
