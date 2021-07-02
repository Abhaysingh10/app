import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_interpreter/LoginAndSignUp/forgetPassword.dart';
import 'package:flutter_application_interpreter/LoginAndSignUp/signup.dart';
import 'package:flutter_application_interpreter/LoginAndSignUp/verification.dart';
import 'package:flutter_application_interpreter/dashboard/bottom_navigation.dart';
import 'package:flutter_application_interpreter/dashboard/dashboard.dart';
import 'package:flutter_application_interpreter/userModel/UserInfo.dart';
import 'package:flutter_application_interpreter/services/login_user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_application_interpreter/services/API_Service.dart';

class login extends StatefulWidget {
  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {
  final _scaffold_key = GlobalKey<ScaffoldState>();
  TextEditingController _email = new TextEditingController();
  TextEditingController _password = new TextEditingController();
  bool isLoggedIn = false;
  UserModel _userModel;
  SharedPreferences _preferences;
  GlobalKey<FormState> globalKey = new GlobalKey<FormState>();
  UserInfo _userInfo;

  Container textFieldEmail() => Container(
          //height: 50.0,
          child: Padding(
        padding: EdgeInsets.fromLTRB(80, 0.0, 80.0, 0.0),
        child: TextFormField(
            controller: _email,
            onSaved: (input) => _userModel.username = input,
            validator: (input) =>
                !input.contains("@") ? "Email ID should be valid" : null,
            keyboardType: TextInputType.emailAddress,
            obscureText: false,
            decoration: _boxDecoration()),
      ));

  Container textFieldPassword() => Container(
        //height: 50.0,
        child: Padding(
          padding: EdgeInsets.fromLTRB(80, 0.0, 80.0, 0.0),
          child: TextFormField(
            controller: _password,
            onSaved: (input) => _userModel.password = input,
            validator: (input) =>
                input.length < 3 ? "Password should long enough" : null,
            obscureText: true,
            decoration: _boxDecoration(),
          ),
        ),
      );

  bool validateAndSave() {
    final form = globalKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _userModel = new UserModel();
    _userInfo = new UserInfo();
  }

  void _login() async {
    if (validateAndSave()) {
      APIService apiServices = new APIService();
      apiServices.login(_userModel).then((value) {
        if (value.token.isNotEmpty) {
          isLoggedIn = true;
          print(value.token);
          savingCredentials(); // save it as token
          _userInfo.getUser();
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (c) => BottomNavigator()));
        } else {
          final SnackBar snackBar =
              SnackBar(content: Text("Login Unsuccessfull"));
          _scaffold_key.currentState.showSnackBar(snackBar);
        }
      });
    }
  }

  void savingCredentials() async {
    SharedPreferences sharedPrefernces = await SharedPreferences.getInstance();
    sharedPrefernces.setString('email', _email.text);
    sharedPrefernces.setString('password', _password.text);
  }

  void savingData() async {}

  InputDecoration _boxDecoration() => InputDecoration(
      contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: Colors.yellow,
          width: 2.0,
        ),
        borderRadius: BorderRadius.circular(50.0),
      ),
      errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50.0),
          borderSide: BorderSide(color: Colors.yellow)),
      focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50.0),
          borderSide: BorderSide(color: Colors.yellow)),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(50.0)),
          borderSide: const BorderSide(color: Colors.transparent, width: 2.0)),
      filled: true,
      fillColor: Colors.grey[300]);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffold_key,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: new Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 150.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      // ---------------->> "Welcome" text
                      alignment: Alignment.topLeft,
                      child: Center(
                        child: Text("welcome",
                            style: TextStyle(
                                fontSize: 40.0,
                                fontWeight: FontWeight.w900,
                                fontFamily: 'Caviar')),
                      ),
                    ),
                    Container(
                      // ----------------->> "User" text
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                        child: Text("user",
                            style: TextStyle(
                                color: Colors.yellow,
                                fontSize: 40.0,
                                fontWeight: FontWeight.w900,
                                fontFamily: "Caviar")),
                      ),
                    ),
                  ],
                ),
                Container(
                  // -------------------->> Logo
                  child: Center(
                    //    child: Flexible(
                    child: Image.asset("images/logo.png"),
                    //  flex: 1,
                  ),
                ),
                //),
                SizedBox(
                  height: 20.0,
                ),
                Form(
                    // ----------- User Credential
                    key: globalKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          // ------------->> "E-mail" text
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(90, 0.0, 0.0, 0.0),
                            child: Text(
                              "E-mail",
                              style: TextStyle(
                                  fontFamily: 'Caviar',
                                  fontWeight: FontWeight.w900),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        textFieldEmail(),
                        SizedBox(
                          height: 15.0,
                        ),
                        Container(
                          // ------------------>> "Password" text
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(90, 0.0, 0.0, 0.0),
                            child: Text(
                              "Password",
                              style: TextStyle(
                                  fontFamily: 'Caviar',
                                  fontWeight: FontWeight.w900),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        textFieldPassword()
                      ],
                    )),
                Center(
                    child: Column(
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      width: 150.0,
                      child: RaisedButton(
                        onPressed: () {
                          _login();
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.0)),
                        color: Colors.grey[200],
                        child: Text(
                          "Login",
                          style: TextStyle(
                              fontFamily: 'Caviar',
                              fontWeight: FontWeight.w900),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 0.5,
                    ),
                    Container(
                      width: 150.0,
                      child: RaisedButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (c) => signUpPage()));
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.0)),
                        color: Colors.yellow,
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                              fontFamily: 'Caviar',
                              fontWeight: FontWeight.w900),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Container(
                      child: RichText(
                        text: TextSpan(
                            text: 'Forgot Password ?',
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (c) => ForgetPassword()));
                              },
                            style: TextStyle(
                                fontFamily: 'Caviar', color: Colors.black)),
                      ),
                    ),
                    // FloatingActionButton(onPressed: () {
                    //   Navigator.push(context,
                    //       MaterialPageRoute(builder: (c) => OTPverification()));
                    // }),
                    SizedBox(
                      height: 50.0,
                    )
                  ],
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
