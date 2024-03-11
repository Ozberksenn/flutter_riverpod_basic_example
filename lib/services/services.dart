import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:riverpodworks/model/user_model.dart';

class AppService {
  static Future<UserModel?> fetch() async {
    var url = Uri.parse("https://reqres.in/api/users?page=2");
    var response = await http.get(url);
    if (response.statusCode == 200) {
      return UserModel.fromJson(jsonDecode(response.body));
    } else {
      return null;
    }
  }
}
