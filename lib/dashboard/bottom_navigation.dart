import 'package:flutter/material.dart';
import 'package:flutter_application_interpreter/dashboard/calendart_carousel.dart';
import 'package:flutter_application_interpreter/dashboard/dashboard.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_interpreter/request/requestInterface.dart';
import 'package:flutter_application_interpreter/profile/profile.dart';
import 'package:flutter_application_interpreter/dashboard/sideDrawer.dart';

class BottomNavigator extends StatefulWidget {
  @override
  _BottomNavigatorState createState() => _BottomNavigatorState();

  //  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
  //   //systemNavigationBarColor: Colors.blue, // navigation bar color
  //   statusBarColor: Colors.pink,

}

class _BottomNavigatorState extends State<BottomNavigator> {
  int _currentIndex = 0;

  List options = [
    Text("Dashoard"),
    Text("Booking"),
    Text("Profile")
    //  Dashboard()
    // Booking(),
    // Profil(),
  ];

  final _pageOPtions = [BookingCarousel(), RequestCard(), Profile()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Color(0xff003B46),
        elevation: 0,
        title: Text(
          "FMS",
          style: TextStyle(color: Colors.white),
        ),
      ),
      drawer: SideDrawer(),
      body: Center(child: _pageOPtions[_currentIndex]),
      bottomNavigationBar: SizedBox(
        height: 60.0,
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          unselectedItemColor: Color(0xffE3E2DE),
          backgroundColor: Color(0xff66a5ad),
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.dashboard_rounded),
              label: 'Dashboard',
              backgroundColor: Colors.red,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today_outlined),
              label: 'Booking',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Profile",
              //  backgroundColor: Colors.yellow),
            )
          ],
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          selectedItemColor: Colors.black,
        ),
      ),
    );
  }
}
