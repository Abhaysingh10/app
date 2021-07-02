import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_application_interpreter/services/login_user_model.dart';

class APIService {
  Future<ResponseModel> login(UserModel _userModel) async {
    // Uri url = Uri.parse("https://reqres.in/api/login");
    Uri url = Uri.parse("https://kq879.mocklab.io/json");
    print(_userModel.toJson());
    //  eve.holt@gmail.com
    //  cityslicka
    Map<String, String> headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };

    final response = await http.post(url,
        body: jsonEncode(_userModel.toJson()), headers: headers);
    print(response.statusCode);
    if (response.statusCode == 200 ||
        response.statusCode == 400 ||
        response.statusCode == 404) {
      return ResponseModel.fromJson(jsonDecode(response.body));
    } else {
      print("Exception Occurred");
    }
  }
}
