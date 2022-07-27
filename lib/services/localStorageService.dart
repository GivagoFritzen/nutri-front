import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService extends ChangeNotifier {
  late SharedPreferences prefs;

  Map<String, String> local = {
    "token": "",
    "refreshToken": "",
    "name": "teste",
    "id": ""
  };

  LocalStorageService() {
    _startPreferences();
  }

  Future<void> _startPreferences() async {
    prefs = await SharedPreferences.getInstance();
    await readLocale();
  }

  setString(String name, String value) async {
    await prefs.setString(name, value);
  }

  readLocale() async {
    local = {
      "token": prefs.getString("token") ?? "",
      "refreshToken": prefs.getString("refreshToken") ?? "",
      "name": prefs.getString("name") ?? "teste",
      "id": prefs.getString("id") ?? "",
    };
    notifyListeners();
  }
}
