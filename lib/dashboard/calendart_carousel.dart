import 'package:flutter_application_interpreter/calendartData/calendarData.dart';
import 'package:flutter_application_interpreter/userModel/UserInfo.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' show DateFormat;
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:animations/animations.dart';

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
  TextEditingController _descriptionController;
  String valueText;
  TimeOfDay startTime;
  TimeOfDay endTime;

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
      new DateTime(2022, 4, 03): [
        new Event(
          date: new DateTime(2022, 4, 03),
          title: 'This is event 1',
          icon: _eventIcon,
          dot: Container(
            margin: EdgeInsets.symmetric(horizontal: 1.0),
            color: Colors.yellow,
            height: 5.0,
            width: 5.0,
          ),
        ),
        new Event(
          date: new DateTime(2022, 4, 03),
          title: 'This is event 2',
          icon: _eventIcon,
          dot: Container(
            margin: EdgeInsets.symmetric(horizontal: 1.0),
            color: Colors.yellow,
            height: 5.0,
            width: 5.0,
          ),
        ),
        new Event(
          date: new DateTime(2022, 4, 03),
          title: 'This is event 3',
          icon: _eventIcon,
          dot: Container(
            margin: EdgeInsets.symmetric(horizontal: 1.0),
            color: Colors.yellow,
            height: 5.0,
            width: 5.0,
          ),
        ),
        new Event(
          date: new DateTime(2022, 4, 03),
          title: 'This is event 4',
          icon: _eventIcon,
          dot: Container(
            margin: EdgeInsets.symmetric(horizontal: 1.0),
            color: Colors.yellow,
            height: 5.0,
            width: 5.0,
          ),
        ),
        new Event(
          date: new DateTime(2022, 4, 03),
          title: 'This is event 5',
          icon: _eventIcon,
          dot: Container(
            margin: EdgeInsets.symmetric(horizontal: 1.0),
            color: Colors.yellow,
            height: 5.0,
            width: 5.0,
          ),
        ),
        new Event(
          date: new DateTime(2022, 4, 03),
          title: 'This is event 6',
          icon: _eventIcon,
          dot: Container(
            margin: EdgeInsets.symmetric(horizontal: 1.0),
            color: Colors.yellow,
            height: 5.0,
            width: 5.0,
          ),
        ),
        new Event(
          date: new DateTime(2022, 4, 03),
          title: 'This is event 7',
          icon: _eventIcon,
          dot: Container(
            margin: EdgeInsets.symmetric(horizontal: 1.0),
            color: Colors.yellow,
            height: 5.0,
            width: 5.0,
          ),
        ),
        new Event(
          date: new DateTime(2022, 4, 03),
          title: 'This is event 8',
          icon: _eventIcon,
          dot: Container(
            margin: EdgeInsets.symmetric(horizontal: 1.0),
            color: Colors.yellow,
            height: 5.0,
            width: 5.0,
          ),
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
        setState(() {
          _markedDateMap.add(dateTimeList[i],
              new Event(title: "$i", date: dateTimeList[i], icon: _eventIcon));
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
    print("This is datelist $dateTimeList");
    String startTime, endTime, description;
    _markedDateMap.getEvents(date).forEach((element) {
      print(element.title);
    });

    // for (var i = 0; i < schedulingTable.length; i++) {
    //   if (date == schedulingTable[i][0]) {
    //     startTime = schedulingTable[i][1];
    //     endTime = schedulingTable[i][2];
    //     description = schedulingTable[i][3];
    //   }
    // }

    events() async {}

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

  void viewEvent(BuildContext context, DateTime date) {
    showDialog(
        context: context,
        builder: (_) {
          return Center(
              child: Expanded(
                  child: Container(
                      height: MediaQuery.of(context).size.height * .7,
                      width: MediaQuery.of(context).size.width * .8,
                      // width: 50,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(12.0),
                            topRight: Radius.circular(12.0),
                            bottomLeft: Radius.circular(12.0),
                            bottomRight: Radius.circular(12.0),
                          )),
                      child: ListView(children: getEventDetails(date)))));
        });
  }

  List _listing = new List();
  List<Widget> getEventDetails(DateTime date) {
    List listing = List<Widget>();
    _markedDateMap.getEvents(date).forEach((element) {
      listing.add(Container(
        color: Colors.red,
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
              height: MediaQuery.of(context).size.height * .15,
              width: MediaQuery.of(context).size.width * .7,
              margin: const EdgeInsets.all(15.0),
              padding: const EdgeInsets.all(3.0),
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(255, 146, 140, 139),
                      blurRadius: 25.0, // soften the shadow
                      spreadRadius: 0.0, //extend the shadow
                      offset: Offset(
                        15.0,
                        15.0,
                      ),
                    )
                  ],
                  color: Colors.white,
                  border: Border.all(color: Color.fromARGB(0, 0, 0, 0)),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5.0),
                    topRight: Radius.circular(5.0),
                    bottomLeft: Radius.circular(5.0),
                    bottomRight: Radius.circular(5.0),
                  )),
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0, top: 8.0),
                child: Text(
                  element.title,
                  style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Caviar',
                      color: Colors.blue[600]),
                ),
              ),
            ),
            Text(element.date.toString())
          ],
        ),
      ));
    });

    return listing;
  }

  _selectTime() async {
    TimeOfDay selectedTime = new TimeOfDay.now();

    final TimeOfDay newTime =
        await showTimePicker(context: context, initialTime: selectedTime);
    if (newTime != null) {
      setState(() {
        selectedTime = newTime;
      });
    }
  }

  askForEvent(DateTime date, List<Event> events) async {
    showDialog(
        context: context,
        builder: (_) => Center(
              child: Container(
                height: MediaQuery.of(context).size.height * .3,
                width: MediaQuery.of(context).size.width * .8,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12.0),
                      topRight: Radius.circular(12.0),
                      bottomLeft: Radius.circular(12.0),
                      bottomRight: Radius.circular(12.0),
                    )),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                        child: Row(
                          children: [
                            SizedBox(width: 20),
                            Text("Add new event"),
                            SizedBox(width: 10),
                            GestureDetector(
                                child: Image.network(
                                    "https://img.icons8.com/ultraviolet/40/000000/plus-2-math.png"),
                                onTap: () => {creatEvent(date)})
                          ],
                        ),
                        height: MediaQuery.of(context).size.height * .1,
                        // width: MediaQuery.of(context).size.width * .1,
                        color: Color.fromARGB(0, 255, 82, 82)),
                    Container(
                        child: Row(
                          children: [
                            SizedBox(
                              width: 20,
                            ),
                            GestureDetector(
                              child: Text("View event"),
                              onTap: () {
                                viewEvent(context, date);

                                // this.setState(() => _currentDate2 = date);
                                // events.forEach((event) {
                                //   viewEvent(context, date);
                                // });
                              },
                            ),
                          ],
                        ),
                        height: MediaQuery.of(context).size.height * .1,
                        // width: MediaQuery.of(context).size.width * .1,
                        color: Color.fromARGB(0, 121, 85, 72))
                  ],
                ),
              ),
            ));
  }

  creatEvent(DateTime date) async {
    startTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
        initialEntryMode: TimePickerEntryMode.input,
        helpText: "Start Time");

    endTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
        initialEntryMode: TimePickerEntryMode.input,
        helpText: "End Time");

    print(_descriptionController);

    await showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title: Text("Description"),
              content: TextField(
                onChanged: (value) {
                  setState(() {
                    valueText = value;
                  });
                },
              ),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.pop(context, 'Cancel'),
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () => Navigator.pop(context, 'OK'),
                  child: const Text('OK'),
                ),
              ],
            ));

    print("Start date $startTime");
    print("End date $endTime");

    final localizations = MaterialLocalizations.of(context);
    final formattedTimeOfDay = localizations.formatTimeOfDay(startTime);
    print("After formatting the information $formattedTimeOfDay");
    print("valutText $valueText");

    _markedDateMap.add(
        date,
        new Event(
          date: date,
          title: valueText,
          dot: Container(
            margin: EdgeInsets.symmetric(horizontal: 1.0),
            color: Colors.yellow,
            height: 5.0,
            width: 5.0,
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    final _calendarCarouselNoHeader = CalendarCarousel<Event>(
      todayBorderColor: Colors.blueGrey[800],
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      // onDayPressed: (date, events) {
      //   this.setState(() => _currentDate2 = date);
      //   events.forEach((event) {
      //     //    widgetVisibility = true;

      //     popCard(context, date);
      //     ;
      //   });
      // },

      onDayPressed: (date, event) async {
        //  print("This is date after onDayPressedn $date");
        askForEvent(date, event);
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
                      child: Text('PREV'),
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
                      child: Text('NEXT'),
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
