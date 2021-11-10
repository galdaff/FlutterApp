import 'package:shared_preferences/shared_preferences.dart';

void updateSharedPreferences(String token) async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  _prefs.setString("token", token);
}

Future<String> getToken() async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  String name = _prefs.getString("token");
  return name;
}
