import 'dart:convert';

// class UserModel {
//   UserModel({
//     this.email,
//     this.password,
//   });

//   String email;
//   String password;

//   factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
//         email: json["email"],
//         password: json["password"],
//       );

//   Map<String, dynamic> toJson() {
//     Map<String, dynamic> map = {
//       "email": email.trim(),
//       "password": password.trim(),
//     };
//     return map;
//   }
// }

class ResponseModel {
  String token;
  String error;

  ResponseModel({this.token, this.error});

  factory ResponseModel.fromJson(Map<String, dynamic> json) {
    return ResponseModel(
      token: json["token"] != null ? json["token"] : "",
      error: json["msg"] != null ? json["error"] : "",
    );
  }
}

class UserModel {
  UserModel({
    this.username,
    this.password,
  });

  String username;
  String password;

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      "username": username,
      "password": password,
    };
    return map;
  }
}
