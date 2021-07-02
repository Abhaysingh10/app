import 'package:flutter/material.dart';
import 'package:flutter_application_interpreter/calendartData/calendarData.dart';
import 'package:flutter_application_interpreter/request/requestInterface.dart';
import 'package:flutter/services.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  CalendarData calendarData = new CalendarData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            child: Text("Hello"),
            onPressed: () => {
                  Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (c) => RequestCard()))
                }),
      ),
    );
  }

  data() {
    calendarData.getUser();
  }
}
