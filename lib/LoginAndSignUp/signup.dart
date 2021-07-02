import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_interpreter/userModel/userModel.dart';
import 'login.dart';
import 'package:flutter_application_interpreter/LoginAndSignUp/login.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter_application_interpreter/dashboard/sideDrawer.dart';
import 'package:flutter_application_interpreter/userModel/signupModel.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:flutter_application_interpreter/services/signup_service.dart';

class signUpPage extends StatefulWidget {
  @override
  _signUpPageState createState() => _signUpPageState();
}

class _signUpPageState extends State<signUpPage> {
  UserInfoModel userInfoModel;
  SignupModel signupModel;
  SignupServices signupServices;
  login loginfiled;
  GlobalKey<FormState> globalFormKey = new GlobalKey<FormState>();
  int selectedRadio;
  int selectedRadioTile;
  login _login = new login();
  String val = "Terms of Services";
  @override
  initState() {
    super.initState();
    signupModel = new SignupModel();
    userInfoModel = new UserInfoModel();
    signupServices = new SignupServices();
    selectedRadio = 0;
    selectedRadioTile = 0;
  }

  setSelectedRadio(int val) {
    setState(() {
      selectedRadioTile = val;
    });
  }

  Container text(String value) => Container(
        child: Padding(
          padding: EdgeInsets.fromLTRB(90, 0.0, 0.0, 0.0),
          child: Text(
            value,
            style: TextStyle(fontFamily: 'Caviar', fontWeight: FontWeight.w900),
          ),
        ),
      );

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

  Padding footer() => Padding(
      padding: EdgeInsets.fromLTRB(60.0, 0.0, 0.0, 0.0),
      child: Column(
        children: <Widget>[
          RadioListTile(
            title: Text(
              "I am looking for interpreter",
              style: TextStyle(fontFamily: "Caviar"),
            ),
            value: 1,
            groupValue: selectedRadioTile,
            activeColor: Colors.yellow,
            onChanged: (val) {
              print("I want to be Interpreter");
              setSelectedRadio(val);
              setState(() {
                Icon(Icons.check);
              });
            },
            selected: false,
          ),
          RadioListTile(
            title: Text(
              "I want to be Interpreter",
              style: TextStyle(fontFamily: "Caviar"),
            ),
            value: 2,
            groupValue: selectedRadioTile,
            activeColor: Colors.yellow,
            onChanged: (val) {
              print("Radio two");
              setSelectedRadio(val);
            },
            selected: false,
          ),
        ],
      ));

  Container signup() => Container(
      alignment: Alignment.center,
      child: Padding(
        padding: EdgeInsets.fromLTRB(80.0, 0.0, 80.0, 0.0),
        child: SizedBox(
          width: 200.0,
          child: RaisedButton(
            onPressed: () {
              _signup();
            },
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.0)),
            color: Colors.yellow,
            child: Text(
              "Sign Up",
              style:
                  TextStyle(fontFamily: 'Caviar', fontWeight: FontWeight.w900),
            ),
          ),
        ),
      ));

  Container textFieldName() => Container(
        child: Padding(
          padding: EdgeInsets.fromLTRB(80, 0.0, 80.0, 0.0),
          child: TextFormField(
              validator: (input) => input.length < 3
                  ? " Name should be more than 3 characters"
                  : null,
              onSaved: (input) => signupModel.name = input,
              decoration: _boxDecoration()),
        ),
      );

  Container textFieldEmail() => Container(
//height: 50.0,
        child: Padding(
          padding: EdgeInsets.fromLTRB(80, 0.0, 80.0, 0.0),
          child: TextFormField(
            validator: (input) =>
                !input.contains("@") ? " Email ID should be valid" : null,
            onSaved: (input) => signupModel.email = input,
            decoration: _boxDecoration(),
          ),
        ),
      );

  Container textFieldMobile() => Container(
        //     height: 50.0,
        child: Padding(
          padding: EdgeInsets.fromLTRB(80, 0.0, 80.0, 0.0),
          child: TextFormField(
            validator: (input) => input.length < 10
                ? " Mobile number should be long enough"
                : null,
            onSaved: (input) => signupModel.phone = input,
            decoration: _boxDecoration(),
          ),
        ),
      );

  Container textFieldCountry() => Container(
        //      height: 50.0,
        child: Padding(
          padding: EdgeInsets.fromLTRB(80, 0.0, 80.0, 0.0),
          child: TextFormField(
            onSaved: (input) => signupModel.country = input,
            decoration: _boxDecoration(),
          ),
        ),
      );

  Container textFieldCurrency() => Container(
        child: Padding(
          padding: EdgeInsets.fromLTRB(80, 0.0, 80.0, 0.0),
          child: TextFormField(
            validator: (input) =>
                input.isEmpty ? "Must select a currency" : null,
            onSaved: (input) => signupModel.currency = input,
            decoration: _boxDecoration(),
          ),
        ),
      );

  Container textFieldBestWay() => Container(
        child: Padding(
          padding: EdgeInsets.fromLTRB(80, 0.0, 80.0, 0.0),
          child: TextFormField(
            validator: (input) =>
                input.isEmpty ? "Must select a currency" : null,
            onSaved: (input) => signupModel.bestWayToContact = input,
            decoration: _boxDecoration(),
          ),
        ),
      );

  _validateAndSave() {
    final form = globalFormKey.currentState;
    if (form.validate()) {
      form.save();
      //print(form.toString());
      return true;
    }
    return false;
  }

  void _signup() async {
    if (_validateAndSave()) {
      print(signupModel.name);
      print(signupModel.email);
      print(signupModel.currency);
      print(signupModel.bestWayToContact);
      // print(" Country" + signupModel.country);
      // print(" Phone " + signupModel.phone);
      signupServices.signup(signupModel).then((value) => {
            if (value != null) {print(value)}
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(slivers: [
      SliverAppBar(
        iconTheme: IconThemeData(),
        leading: IconButton(
          color: Colors.black,
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.of(context).pop(),
        ),
        toolbarHeight: 150.0,
        backgroundColor: Colors.transparent,
        title: Text(
          "Get Started",
          style: TextStyle(
              color: Colors.black,
              fontFamily: "Caviar",
              fontSize: 30.0,
              fontWeight: FontWeight.w900),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      SliverList(
        delegate: SliverChildListDelegate([
          Form(
            key: globalFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20.0,
                ),
                text("Name"),
                SizedBox(height: 5.0),
                textFieldName(),

                SizedBox(height: 15.0),
                text("E-mail"),
                SizedBox(height: 5.0),
                textFieldEmail(),

                SizedBox(height: 15.0),
                text("Currency"),
                SizedBox(height: 5.0),
                textFieldCurrency(),

                SizedBox(height: 15.0),
                text("Best way to contact"),
                SizedBox(height: 5.0),
                textFieldBestWay(),

                SizedBox(height: 15.0),
                // text("Phone"),
                // SizedBox(height: 5.0),
                // textFieldMobile(),
                // SizedBox(height: 15.0),
                text("Country / Phone"),
                SizedBox(
                  height: 5.0,
                ),
                Row(
                  children: [
                    CountryCodePicker(
                      onChanged: (input) =>
                          signupModel.country = input.toString(),
                      showFlag: false,
                      padding: EdgeInsets.fromLTRB(90.0, 0.0, 10.0, 0.0),
                      showCountryOnly: false,
                      alignLeft: false,
                      favorite: ['+91', 'IN'],
                    ),
                    Expanded(
                      child: Padding(
                        padding:
                            const EdgeInsets.fromLTRB(10.0, 0.0, 80.0, 0.0),
                        child: TextFormField(
                            validator: (input) =>
                                input.length < 10 || input.length > 10
                                    ? "Number should be correct"
                                    : null,
                            onSaved: (input) => signupModel.phone = input,
                            decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.fromLTRB(10.0, 0.0, 40.0, 0.0),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Colors.yellow,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(50.0),
                                ),
                                errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50.0),
                                    borderSide:
                                        BorderSide(color: Colors.yellow)),
                                focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50.0),
                                    borderSide:
                                        BorderSide(color: Colors.yellow)),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(50.0)),
                                    borderSide: const BorderSide(
                                        color: Colors.transparent, width: 2.0)),
                                filled: true,
                                fillColor: Colors.grey[300])),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.0),
                Padding(
                  padding: const EdgeInsets.fromLTRB(85, 0.0, 80.0, 0.0),
                  child: Container(
                    child: RichText(
                      text: TextSpan(
                          text: " *By clicking signing up, you agree to our ",
                          style: TextStyle(
                              fontFamily: 'Caviar', color: Colors.black),
                          children: [
                            TextSpan(
                                text: "Terms and Services",
                                style: TextStyle(
                                    fontFamily: 'Caviar',
                                    color: Colors.blueAccent),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    print("Clicked on Terms and Services");
                                  }),
                            TextSpan(
                                text: " and that you have read our",
                                style: TextStyle(
                                    color: Colors.black, fontFamily: 'Caviar')),
                            TextSpan(
                                text: " Privacy Policy.",
                                style: TextStyle(
                                    fontFamily: 'Caviar',
                                    color: Colors.blueAccent),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    print("Clicked on Privacy Policy");
                                  })
                          ]),
                    ),
                  ),
                ),

                SizedBox(height: 35.0),
                //   footer(),
                SizedBox(
                  height: 10.0,
                ),
                signup(),
                SizedBox(height: 70.0)
              ],
            ),
          )
        ]),
      ),
    ]));
  }
}
