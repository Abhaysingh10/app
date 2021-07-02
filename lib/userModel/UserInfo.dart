import 'package:flutter_application_interpreter/userModel/userModel.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class UserInfo {
  Future<SharedPreferences> prefs = SharedPreferences.getInstance();
  Future<UserInfoModel> getUserData() async {
    Map<String, String> headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };

    Uri uri = Uri.parse("https://kq879.mocklab.io/json/calendarEvents");
    var response = await http.get(uri, headers: headers);
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      //  print(jsonData);
      return UserInfoModel.fromJson(jsonDecode(response.body));
    } else {
      print("Error happened");
    }
  }

  getUser() {
    getUserData().then((value) {
      if (value.email.isNotEmpty) {
        prefs.then((pref) {
          // pref.setString('id', value.id.toString());
          // pref.setString('name', value.name.toString());
          // pref.setString('username', value.username.toString());
          // pref.setString('email', value.email.toString());
        });
      } else {
        print("Error");
      }
    });
  }
}
