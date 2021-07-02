import 'dart:async';
import 'package:flutter_application_interpreter/dashboard/bottom_navigation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/services.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter_application_interpreter/LoginAndSignUp/login.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Color(0xff003B46)));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var getEmail;

  void getValidation() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    getEmail = sharedPreferences.getString("email");
    if (getEmail != null) {
      Navigator.push(
          context, MaterialPageRoute(builder: (c) => BottomNavigator()));
    } else {
      Navigator.push(context, MaterialPageRoute(builder: (c) => login()));
    }
  }

  @override
  void initState() {
    Timer(Duration(seconds: 3), () => {getValidation()});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: AnimatedSplashScreen(
          // splash: Icons.ac_unit,
          splash: Image.asset("images/logo.png"),
          nextScreen: login(),
          splashTransition: SplashTransition.scaleTransition,
        )
        // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
