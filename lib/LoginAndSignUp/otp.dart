import 'package:email_auth/email_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

class OTP {
  bool resposne = false;
  OTP({this.email});

  TextEditingController email = new TextEditingController();
  //String _email = "1995.abhaysingh@gmail.com";

  Future<bool> sendOTP(BuildContext context) async {
    // SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    //  EmailAuth.sessionName = "Test Sessiom";
    // var res = await EmailAuth.sendOtp(receiverMail: email.text);
    // if (res) {
    //   //sharedPreferences.setString("key", value);
    //   print(res);
    //   resposne = true;
    //   return resposne;
    // }
  }

  verifyOTP(BuildContext context, String otp) async {
    // var res = EmailAuth.validate(receiverMail: email.text, userOTP: otp);
    // if (res) {
    //   print("OTP verified");
    // } else {
    //   print("OTP invalid");
    // }
  }
}
