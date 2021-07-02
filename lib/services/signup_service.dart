import 'dart:convert';
import 'package:flutter_application_interpreter/userModel/signupModel.dart';
import 'package:flutter_application_interpreter/userModel/userModel.dart';
import 'package:http/http.dart' as http;

class SignupServices {
  Future signup(SignupModel signupModel) async {
    Uri uri = Uri.parse("https://kq879.mocklab.io/signup");

    Map<String, String> headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };
    try {
      final response = await http.post(uri,
          body: jsonEncode(signupModel.toJson()), headers: headers);
      print(response.statusCode);
    } catch (e) {
      print(e);
    }
  }
}
