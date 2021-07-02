import 'package:flutter/material.dart';
import 'package:flutter_application_interpreter/LoginAndSignUp/login.dart';
import 'package:flutter_application_interpreter/profile/profile.dart';
import 'package:flutter_application_interpreter/userModel/UserInfo.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_application_interpreter/dashboard/dashboard.dart';

class SideDrawer extends StatefulWidget {
  @override
  _SideDrawerState createState() => _SideDrawerState();
}

class _SideDrawerState extends State<SideDrawer> {
  String email, username, name;
  UserInfo userInfo = new UserInfo();

  logout() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.clear();
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (c) => login()));
  }

  getData() async {
    userInfo.getUserData().then((value) {
      if (value.email.isNotEmpty) {
        print(value.email);
        setState(() {
          name = value.name;
          email = value.email;
          username = value.username;
        });
      } else {
        print("Error");
      }
    });
  }

  @override
  void initState() {
    getData();
    print("I am initState");
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: SafeArea(
      child: Drawer(
          child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(name ?? "User"),
            accountEmail: Text(email ?? "Email@email.com"),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://images.unsplash.com/photo-1493666438817-866a91353ca9?ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8cGVyc29uYXxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
            ),
            decoration: BoxDecoration(color: Color(0xff07575b)),
          ),
          ListTile(
            title: Text(username ?? ""),
            leading: Icon(Icons.verified_user_outlined),
            onTap: () => Navigator.pushReplacementNamed(context, 'home'),
          ),
          ListTile(
            title: Text("Clients"),
            leading: Icon(Icons.person_outline_sharp),
            onTap: () => Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (c) => Dashboard())),
          ),
          ListTile(
            title: Text("Subscriptions"),
            leading: Icon(Icons.star_outline),
            onTap: () => Navigator.pushReplacementNamed(context, 'home'),
          ),
          ListTile(
            title: Text("Payments"),
            leading: Icon(Icons.credit_card_outlined),
            onTap: () => Navigator.pushReplacementNamed(context, 'home'),
          ),
          ListTile(
            title: Text("Help"),
            leading: Icon(Icons.help_outline_outlined),
            onTap: () => Navigator.pushReplacementNamed(context, 'home'),
          ),
          ListTile(
            title: SizedBox(height: MediaQuery.of(context).size.height * .5),
          ),
          ListTile(
            title: TextButton(
              style: flatButtonStyle,
              child: Text(
                "Logout",
                style: textStyle(),
              ),
              onPressed: () => logout(),
            ),
          ),
          // BottomAppBar(
          //   color: Colors.transparent,
          //   //elevation: -0.0,
          //   child: TextButton(
          //     style: flatButtonStyle,
          //     child: Text(
          //       "Logout",
          //       style: textStyle(),
          //     ),
          //     onPressed: () => logout(),
          //   ),
          // )
        ],
      )),
    ));
  }

  final ButtonStyle flatButtonStyle = TextButton.styleFrom(
    backgroundColor: Colors.red,
    primary: Colors.black87,
    //minimumSize: Size(88, 36),
    padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 10.0),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(40.0)),
    ),
  );

  TextStyle textStyle() => TextStyle(fontFamily: 'Caviar', color: Colors.white);
}
