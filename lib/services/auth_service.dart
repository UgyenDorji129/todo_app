import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:todo_app/model/user_model.dart';

class LoginService {
  static Future<Map<String, dynamic>> login(
      String username, String password) async {
    Map<String, dynamic> result;
    Uri url = Uri.parse('https://dummyjson.com/auth/login');
    Map<String, String> data = {'username': username, 'password': password};
    try {
      var response = await http.post(url,
          body: json.encode(data),
          headers: {'Content-Type': 'application/json'});
      if (response.statusCode == 200) {
        User user = User.fromJson(json.decode(response.body));
        result = {
          'status': true,
          'message': 'Successfully logged in.',
          'data': user
        };
      } else {
        String message = '${json.decode(response.body)['message']}.';
        result = {
          'status': false,
          'message': 'Logged in failed.',
          'data': message
        };
      }
    } on SocketException {
      result = {
        'status': false,
        'message': 'Unsuccessful request.',
        'data': 'No internet Connection'
      };
    }
    return result;
  }
}
