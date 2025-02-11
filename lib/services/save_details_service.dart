import 'package:shared_preferences/shared_preferences.dart';

class SaveDetailService {
  Future<void> saveUser(String username, String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final DateTime now = DateTime.now();

    await prefs.setString('username', username);
    await prefs.setString('token', token);
    await prefs.setInt('savedAt', now.millisecondsSinceEpoch); // Save timestamp
  }

  Future<bool> hasValidUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    String? username = prefs.getString('username');
    String? token = prefs.getString('token');
    int? savedAt = prefs.getInt('savedAt');

    if (username == null || token == null || savedAt == null) {
      return false;
    }

    final DateTime savedTime = DateTime.fromMillisecondsSinceEpoch(savedAt);
    final DateTime now = DateTime.now();
    final Duration difference = now.difference(savedTime);

    if (difference.inMinutes >= 10) {
      await prefs.clear();
      return false;
    }
    return true;
  }
}
