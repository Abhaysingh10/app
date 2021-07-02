import 'dart:math';

import 'package:flutter_application_interpreter/calendartData/calendarData.dart';
import 'package:flutter_application_interpreter/userModel/UserInfo.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' show DateFormat;
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/classes/event_list.dart';
import 'package:animations/animations.dart';
import 'package:flutter/services.dart';

class BookingCarousel extends StatefulWidget {
  @override
  _BookingCarouselState createState() => _BookingCarouselState();
}

class _BookingCarouselState extends State<BookingCarousel> {
  List<DateTime> dateTimeList;

  var schedulingTable;

  UserInfo userInfo = new UserInfo();
  CalendarData calendarData = new CalendarData();
  bool widgetVisibility = false;
  DateTime _currentDate = DateTime.now();
  DateTime _currentDate2 = DateTime.now();
  String _currentMonth = DateFormat.yMMM().format(DateTime.now());
  DateTime _targetDateTime = DateTime.now();
  double _height = 0, _width = 0;
  bool up = false;
  final transitionType = ContainerTransitionType.fade;
//  List<DateTime> _markedDate = [DateTime(2018, 9, 20), DateTime(2018, 10, 11)];

  static Widget _eventIcon = new Container(
    decoration: new BoxDecoration(
        //color: Colors.white,
        //borderRadius: BorderRadius.all(Radius.circular(0)),
        border: Border.all(color: Colors.blue, width: 2.0)),
    child: new Icon(
      Icons.person,
      color: Colors.amber,
    ),
  );

  EventList<Event> _markedDateMap = new EventList<Event>(
    events: {
      new DateTime(2021, 5, 03): [
        new Event(
          date: new DateTime(2021, 5, 30),
          title: 'Event 1',
          icon: _eventIcon,
          dot: Container(
            margin: EdgeInsets.symmetric(horizontal: 1.0),
            color: Colors.yellow,
            height: 5.0,
            width: 5.0,
          ),
        ),
        new Event(
          date: new DateTime(2021, 4, 10),
          title: 'Event 2',
          icon: _eventIcon,
        ),
      ],
    },
  );

  @override
  void initState() {
    dateTimeList = new List<DateTime>();

    /// getting the calendar scheduling data here.

    calendarData.getCalendarData().then((value) async {
      schedulingTable = List.generate(
          value.scheduleDetails.length, (i) => List(4),
          growable: true);
      if (value.name.isNotEmpty)
        await {
          for (int i = 0; i < value.scheduleDetails.length; i++)
            {
              dateTimeList.add(value.scheduleDetails[i].date),
              schedulingTable[i][0] = value.scheduleDetails[i].date,
              schedulingTable[i][1] = value.scheduleDetails[i].startTime,
              schedulingTable[i][2] = value.scheduleDetails[i].endTime,
              schedulingTable[i][3] = value.scheduleDetails[i].description
            }
        };
      else {
        print(value);
      }
      print(dateTimeList);

      for (var i = 0; i < dateTimeList.length; i++) {
        await setState(() {
          _markedDateMap.addAll(dateTimeList[i], [
            new Event(title: "$i", date: dateTimeList[i], icon: _eventIcon)
          ]);
        });
      }
    });

    super.initState();
  }

  getDetails() {
    CalendarData calendarData = new CalendarData();
    calendarData.getCalendarData().then((value) {
      if (value.name.isNotEmpty) {
        for (var i = 0; i < value.scheduleDetails.length; i++) {}
      }
    });
  }

  void popCard(context, DateTime date) {
    setState(() {
      _height = MediaQuery.of(context).size.height / 2;
      _width = MediaQuery.of(context).size.width / 1.2;
    });
    //  print(schedulingTable.length);
    String startTime, endTime, description;
    for (var i = 0; i < schedulingTable.length; i++) {
      if (date == schedulingTable[i][0]) {
        startTime = schedulingTable[i][1];
        endTime = schedulingTable[i][2];
        description = schedulingTable[i][3];
      }
    }

    print(startTime);
    print(endTime);
    print(description);

    showDialog(
        context: context,
        builder: (BuildContext bc) {
          return Center(
            child: Expanded(
              child: Container(
                //  transform: Transform.scale(scale: scale) ,
                height: MediaQuery.of(bc).size.height * .5,
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Color(0xffA22447).withOpacity(.05),
                          spreadRadius: 1,
                          blurRadius: 20,
                          offset: Offset(4, 8))
                    ],
                    borderRadius: BorderRadius.all(Radius.circular(36.0))),
                // color: Colors.redAccent,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(30.0, 30.0, 0.0, 10.0),
                      child: Column(children: [
                        Container(
                          //width: MediaQuery.of(bc).size.width,
                          child: Text("Details",
                              style: TextStyle(
                                  fontFamily: "Caviar", fontSize: 50.0)),
                          // decoration: BoxDecoration(
                          //   border:
                          //       Border(bottom: BorderSide(color: Colors.grey)),
                          // ),
                        ),
                        SizedBox(height: 50.0),
                        Container(
                          //width: MediaQuery.of(bc).size.width,
                          child: Text("Start Time ----> $startTime",
                              style: TextStyle(
                                  fontFamily: "Caviar", fontSize: 25.0)),
                          // decoration: BoxDecoration(
                          //   border:
                          //       Border(bottom: BorderSide(color: Colors.grey)),
                          // ),
                        ),
                        SizedBox(height: 35.0),
                        Container(
                          //width: MediaQuery.of(bc).size.width,
                          child: Text("End Time ----> $endTime",
                              style: TextStyle(
                                  fontFamily: "Caviar", fontSize: 25.0)),
                          // decoration: BoxDecoration(
                          //   border:
                          //       Border(bottom: BorderSide(color: Colors.grey)),
                          // ),
                        ),
                        SizedBox(height: 35.0),
                        Container(
                          //width: MediaQuery.of(bc).size.width,
                          child: Text("Description ----> $description",
                              style: TextStyle(
                                  fontFamily: "Caviar", fontSize: 25.0)),
                          // decoration: BoxDecoration(
                          //   border:
                          //       Border(bottom: BorderSide(color: Colors.grey)),
                          // ),
                        )
                      ]),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  //MediaQuery.of(context).size.height * .5
  //MediaQuery.of(context).size.width * .4

  @override
  Widget build(BuildContext context) {
    final _calendarCarouselNoHeader = CalendarCarousel<Event>(
      todayBorderColor: Colors.blueGrey[800],
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      onDayPressed: (date, events) {
        this.setState(() => _currentDate2 = date);
        events.forEach((event) {
          //    widgetVisibility = true;

          popCard(context, date);
          ;
        });
      },
      //daysHaveCircularBorder: false,
      showOnlyCurrentMonthDate: true,
      weekendTextStyle:
          TextStyle(color: Colors.redAccent, fontFamily: "Caviar"),

      weekFormat: false,
//      firstDayOfWeek: 4,
      markedDatesMap: _markedDateMap,
      //height: 420.0,
      selectedDateTime: _currentDate2,
      //   targetDateTime: _targetDateTime,
      customGridViewPhysics: NeverScrollableScrollPhysics(),
      markedDateCustomShapeBorder:
          CircleBorder(side: BorderSide(color: Color(0xff66a5ad))),
      markedDateCustomTextStyle: TextStyle(
        fontSize: 14,
        color: Color(0xff07575b),
      ),
      showHeader: false,
      todayTextStyle:
          TextStyle(color: Colors.blueGrey[800], fontFamily: "Caviar"),
      selectedDayButtonColor: Color(0xff5AC6AC),
      selectedDayTextStyle:
          TextStyle(color: Colors.white, fontFamily: "Caviar"),
      minSelectedDate: _currentDate.subtract(Duration(days: 360)),
      maxSelectedDate: _currentDate.add(Duration(days: 360)),
      prevDaysTextStyle: TextStyle(
        fontSize: 16,
        color: Colors.pinkAccent,
      ),
      inactiveDaysTextStyle: TextStyle(
        color: Colors.tealAccent,
        fontSize: 16,
      ),
      onCalendarChanged: (DateTime date) {
        this.setState(() {
          _targetDateTime = date;
          _currentMonth = DateFormat.yMMM().format(_targetDateTime);
        });
      },
      onDayLongPressed: (DateTime date) {
        print('long pressed date $date');
      },
    );

    final description = Visibility(
        child: Container(
      transform: Transform.translate(offset: Offset(0, up == true ? -100 : 0))
          .transform,
      decoration: BoxDecoration(
          color: Colors.redAccent,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(36.0), topRight: Radius.circular(36.0))),
      // color: Colors.redAccent,
      child: Text("Description"),
      height: _height,
      width: MediaQuery.of(context).size.width,
    ));

    return new Scaffold(
        appBar: new AppBar(
          backgroundColor: Color(0xff07575B).withOpacity(0.5),
          centerTitle: true,
          automaticallyImplyLeading: false,
          title: new Text(
            "My Bookings",
            style: TextStyle(fontFamily: "Caviar"),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(
                  top: 30.0,
                  bottom: 16.0,
                  left: 16.0,
                  right: 16.0,
                ),
                child: new Row(
                  children: <Widget>[
                    Expanded(
                        child: Text(
                      _currentMonth,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24.0,
                      ),
                    )),
                    FlatButton(
                      // child: Text('PREV'),
                      onPressed: () {
                        setState(() {
                          _targetDateTime = DateTime(
                              _targetDateTime.year, _targetDateTime.month - 1);
                          _currentMonth =
                              DateFormat.yMMM().format(_targetDateTime);
                        });
                      },
                    ),
                    FlatButton(
                      // child: Text('NEXT'),
                      onPressed: () {
                        setState(() {
                          _targetDateTime = DateTime(
                              _targetDateTime.year, _targetDateTime.month + 1);
                          _currentMonth =
                              DateFormat.yMMM().format(_targetDateTime);
                        });
                      },
                    )
                  ],
                ),
              ),
              //custom icon
              Container(
                height: MediaQuery.of(context).size.height * .5,
                // margin: EdgeInsets.symmetric(horizontal: 16.0),
                child: _calendarCarouselNoHeader,
              ), // This trailing comma makes auto-formatting nicer for build methods.
              //custom icon without header
              Container(
                height: MediaQuery.of(context).size.height,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16.0),
                //child: description,
              ), //
            ],
          ),
        ));
  }
}
