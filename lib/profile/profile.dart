import 'dart:ui';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_interpreter/LoginAndSignUp/login.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_application_interpreter/userModel/UserInfo.dart';

class Profile extends StatefulWidget {
  getData() {
    print("you are into Profile class");
  }

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String username, email, phone;
  BoxDecoration boxDecoration() => BoxDecoration(
          border: Border(
        top: BorderSide(color: Colors.grey),
        bottom: BorderSide(color: Colors.grey),
      ));

  TextStyle textStyle() => TextStyle(
      fontFamily: "Caviar",
      fontWeight: FontWeight.w400,
      fontSize: 16,
      color: Colors.black87);

  Align align(value) => Align(
      alignment: Alignment.centerLeft,
      child: Text(
        value,
        style: textStyle(),
      ));

  UserInfo userInfo = new UserInfo();

  @override
  void initState() {
    getUser();
    super.initState();
  }

  getUser() {
    userInfo.getUserData().then((value) {
      if (value.email.isNotEmpty) {
        print(value.email);
        setState(() {
          username = value.name;
          email = value.email;
          phone = value.phone;
        });
      } else {
        print("Error");
      }
    });
  }

  logout() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.clear();
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (c) => login()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 120,
              child: Container(
                  //     color: Colors.red,
                  ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
                  child: CircleAvatar(
                    radius: 60.0,
                    backgroundImage: NetworkImage(
                        "https://images.unsplash.com/photo-1493666438817-866a91353ca9?ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8cGVyc29uYXxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Text(
                          username ?? "",
                          style: TextStyle(
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Caviar"),
                        ),
                        height: 35.0,
                        width: 200.0,
                        // color: Colors.pink,
                      ),
                      Container(
                        child: Text(
                          "Interpreter",
                          style: TextStyle(fontFamily: "Caviar"),
                        ),
                        height: 20.0,
                        width: 150.0,
                        //        color: Colors.green,
                      )
                    ],
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20.0, 20.0, 0.0, 0.0),
              child: Row(
                children: [
                  Container(
                    //       color: Colors.amber,
                    height: 50.0,
                    width: 50.0,
                    child: Icon(
                      Icons.phone,
                      color: Colors.grey.shade600,
                    ),
                  ),
                  Container(
                    //       color: Colors.yellow,
                    height: 50.0,
                    width: 200.0,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        phone ?? "",
                        style: TextStyle(
                            fontFamily: "Caviar",
                            color: Colors.grey.shade600,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20.0, 0.0, 0.0, 0.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    //        color: Colors.amber,
                    height: 50.0,
                    width: 50.0,
                    child: Icon(
                      Icons.email_outlined,
                      color: Colors.grey.shade600,
                    ),
                  ),
                  Container(
                    //       color: Colors.yellow,
                    height: 50.0,
                    width: 200.0,
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          email ?? "",
                          style: TextStyle(
                              fontFamily: "Caviar",
                              color: Colors.grey.shade600),
                        )),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
              child: Row(
                children: [
                  Container(
                    height: 80.0,
                    width: MediaQuery.of(context).size.width / 2,
                    decoration: boxDecoration(),
                    child: Align(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "\u{20B9}1400.0",
                            style: TextStyle(
                                fontWeight: FontWeight.w900, fontSize: 19),
                          ),
                          Text("Wallet")
                        ],
                      ),
                      alignment: Alignment.center,
                    ),
                  ),
                  Container(
                    height: 80.0,
                    width: MediaQuery.of(context).size.width / 2,
                    decoration: boxDecoration(),
                    child: Align(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "14",
                            style: TextStyle(
                                fontWeight: FontWeight.w900, fontSize: 19.0),
                          ),
                          Text("Appointments")
                        ],
                      ),
                      alignment: Alignment.center,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Padding(
                padding: EdgeInsets.fromLTRB(20.0, 10.0, 0.0, 20.0),
                child: Row(
                  children: [
                    Column(
                      children: [
                        Container(
                          //        color: Colors.amber,
                          height: 50.0,
                          width: 50.0,
                          child: Icon(
                            Icons.favorite_outline,
                            color: Colors.blue.shade400,
                          ),
                        ),
                        Container(
                          //        color: Colors.amber,
                          height: 50.0,
                          width: 50.0,
                          child: Icon(
                            Icons.payment_outlined,
                            color: Colors.blue.shade400,
                          ),
                        ),
                        Container(
                          //        color: Colors.amber,
                          height: 50.0,
                          width: 50.0,
                          child: Icon(
                            Icons.label_outline,
                            color: Colors.blue.shade400,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
//                          color: Colors.amber,
                            height: 50.0,
                            width: 150.0,
                            child: align("Your favorites")),
                        Container(
                          //        color: Colors.amber,
                          height: 50.0,
                          width: 150.0,
                          child: align("Payment"),
                        ),
                        Container(
                          //        color: Colors.amber,
                          height: 50.0,
                          width: 150.0,
                          child: align("Promotions"),
                        ),
                      ],
                    )
                  ],
                )),
            Row(children: [
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Container(
                  height: 70.0,
                  width: 50.0,
                  child: Icon(
                    Icons.power_settings_new,
                    color: Colors.red,
                  ),
                  decoration: BoxDecoration(
                      border:
                          Border(top: BorderSide(color: Colors.grey.shade600))),
                ),
              ),
              Expanded(
                child: Container(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: RichText(
                        text: TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => logout(),
                      text: "Logout",
                      style: TextStyle(
                          color: Colors.redAccent,
                          fontFamily: "Caviar",
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    )),
                  ),
//            color: Colors.red,
                  height: 70.0,
                  width: MediaQuery.of(context).size.width / 2,
                  decoration: BoxDecoration(
                      border: Border(
                          //                  bottom: BorderSide(color: Colors.grey.shade600),
                          top: BorderSide(color: Colors.grey.shade600))),
                ),
              )
            ])
          ],
        ),
      ),
    );
  }
}
