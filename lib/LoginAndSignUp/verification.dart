import 'package:flutter/material.dart';
import 'package:flutter_application_interpreter/LoginAndSignUp/otp.dart';
import 'package:pin_entry_text_field/pin_entry_text_field.dart';

class OTPverification extends StatefulWidget {
  @override
  _OTPverificationState createState() => _OTPverificationState();
}

class _OTPverificationState extends State<OTPverification> {
  OTP otp;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    otp = new OTP();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                    "Enter the verification code we just sent you on your email address.",
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
              SizedBox(height: 50.0),
              Container(
                //width: MediaQuery.of(context).size.width / 1.3,
                child: PinEntryTextField(
                  fields: 6,
                  fieldWidth: 50.0,
                  showFieldAsBox: true,
                  onSubmit: (String pin) {
                    otp.verifyOTP(context, pin); //end showDialog()
                  }, // end onSubmit
                ),
              ),
              SizedBox(height: 50.0),
              Container(
                child: RaisedButton(
                  //  onPressed: ob,
                  child: Center(
                    child: Text(
                      "Verify",
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Caviar',
                          fontSize: 20.0,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40.0)),
                  color: Color(0xff05D1B8),
                ),
                width: 100.0,
                height: 50.0,
              )
            ],
          ),
        ),
      ),
    );
  }
}
