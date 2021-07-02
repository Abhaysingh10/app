import 'package:flutter/material.dart';
import 'package:flutter_application_interpreter/LoginAndSignUp/otp.dart';
import 'package:pin_entry_text_field/pin_entry_text_field.dart';

enum WidgeMarker { enterEmailFormfield, otpBox }

class ForgetPassword extends StatefulWidget {
  @override
  _ForgetPasswordState createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword>
    with SingleTickerProviderStateMixin<ForgetPassword> {
  WidgeMarker selectedWidgetMarker = WidgeMarker.enterEmailFormfield;

  AnimationController _controller;
  Animation<Offset> _offsetAnimation;

  TextEditingController _email = new TextEditingController();
  OTP otp;
  bool response;

  TextStyle _textStyle() => TextStyle(
      color: Colors.grey[400],
      fontFamily: 'Caviar',
      fontSize: 20.0,
      fontWeight: FontWeight.w500);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    otp = new OTP();
    _controller =
        AnimationController(duration: Duration(seconds: 2), vsync: this);
    _offsetAnimation = Tween<Offset>(
      begin: Offset(0.0, 0.0),
      end: Offset(1.5, 0.0),
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.elasticIn));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 120.0),
            Container(
              child: Image.asset("images/forgotpassword.jpg"),
              height: MediaQuery.of(context).size.height / 3,
              width: MediaQuery.of(context).size.width / 2.1,
            ),
            Container(
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  "Enter the email address associated with your account.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.grey[700],
                      fontFamily: 'Caviar',
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500),
                ),
              ),
              width: MediaQuery.of(context).size.width / 1.5,
              height: 70.0,
            ),
            Container(
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  "We will email you a link to reset your password.",
                  textAlign: TextAlign.center,
                  style: _textStyle(),
                ),
              ),
              width: MediaQuery.of(context).size.width / 1.5,
              height: 80.0,
            ),
            SizedBox(height: 50.0),
            Container(
                height: 50.0,
                width: MediaQuery.of(context).size.width / 1.2,
                child:
                    Column(children: [Expanded(child: getCustomContainer())])),
            SizedBox(height: 50.0),
            Container(
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    selectedWidgetMarker = WidgeMarker.otpBox;
                  });
                  // otp.sendOTP(context).then((value) => {
                  //       if (value == true)
                  //         {
                  //           setState(() {
                  //             selectedWidgetMarker = WidgeMarker.otpBox;
                  //           })
                  //         }
                  //     });
                },
                style: ElevatedButton.styleFrom(
                    primary: Color(0xff05D1B8), elevation: 5),

                child: Center(
                  child: Text(
                    "Send",
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Caviar',
                        fontSize: 20.0,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                // shape: RoundedRectangleBorder(
                //     borderRadius: BorderRadius.circular(40.0)),
              ),
              width: 100.0,
              height: 50.0,
            ),
            SizedBox(
              height: 60.0,
            )
          ],
        ),
      ),
    ));
  }

  Widget getCustomContainer() {
    switch (selectedWidgetMarker) {
      case WidgeMarker.enterEmailFormfield:
        return getEmailContainer();
      case WidgeMarker.otpBox:
        return getOTPContainer();
    }

    return getEmailContainer();
  }

  Widget getEmailContainer() {
    return TextFormField(
      controller: otp.email = _email,
      // validator: (input) =>
      //     !input.contains("@") ? "Email ID should be valid" : null,
      textAlign: TextAlign.center,
      keyboardType: TextInputType.emailAddress,
      decoration: new InputDecoration(
        hintText: "Enter Email Address",
        hintStyle: _textStyle(),
      ),
    );
  }

  Widget getOTPContainer() {
    return SlideTransition(
      position: _offsetAnimation,
      child: PinEntryTextField(
        fields: 6,
        fieldWidth: 50.0,
        showFieldAsBox: true,

        onSubmit: (String pin) {
          otp.verifyOTP(context, pin); //end showDialog()
        }, // end onSubmit
      ),
    );
  }
}
