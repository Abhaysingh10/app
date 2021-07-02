import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_calendar/flutter_clean_calendar.dart';

class BookingTwo extends StatefulWidget {
  @override
  _BookingTwoState createState() => _BookingTwoState();
}

class _BookingTwoState extends State<BookingTwo> {
  int object = 1;
  DateTime _selectedDate;
  DateTime selectedDay;
  List selectedEvent;
  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(Duration(seconds: 1));
    super.initState();
    selectedEvent = events[selectedDay] ?? [];
  }

  final Map<DateTime, List> events = {
    DateTime(2020, 12, 12): [
      {'Name': 'Your Event Name', 'isDone ': true},
      {'Name': 'Your Event Name', 'isDone ': true},
      {'Name': 'Your Event Name', 'isDone ': false},
    ],
    DateTime(2020, 12, 2): [
      {'Name': 'Your Event Name', 'isDone ': true},
      {'Name': 'Your Event Name', 'isDone ': true},
      {'Name': 'Your Event Name', 'isDone ': false}
    ]
  };

  void _handleData(date) {
    setState(() {
      selectedDay = date;
      selectedEvent = events[selectedDay] ?? [];
    });
    print(selectedDay);
  }

  MaterialButton button(String value) => MaterialButton(
      onPressed: null,
      shape: roundedBorder(),
      disabledElevation: 1.5,
      child: Text(
        value,
        style: textStyle(),
      ),
      disabledColor: Colors.greenAccent);

  RoundedRectangleBorder roundedBorder() => RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(15.0)));

  TextStyle textStyle() => TextStyle(
      fontSize: 14.1,
      fontWeight: FontWeight.w700,
      fontFamily: 'Caviar',
      color: Colors.black54);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xFF959f5d),
      body: Column(children: [
        SizedBox(
          height: 180.0,
        ),
        Expanded(
          flex: 1,
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            //color: Colors.red,
            child: Stack(
              children: [
                Container(
                  height: 600.0,
                  child: Calendar(
                    hideTodayIcon: true,
                    hideArrows: true,
                    weekDays: ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"],
                    startOnMonday: false,
                    selectedColor: Color(0x1F727e4c),
                    todayColor: Colors.red,
                    eventColor: Colors.green,
                    eventDoneColor: Colors.amber,
                    onRangeSelected: (range) {
                      print("seleted Day ${range.from}, ${range.to}");
                    },
                    onDateSelected: (date) {
                      return _handleData(date);
                    },
                    events: events,
                    isExpanded: true,
                    dayOfWeekStyle: textStyle(),
                  ),
                ),
                Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: SingleChildScrollView(
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(36.0),
                                topRight: Radius.circular(36.0))),
                        margin: EdgeInsets.symmetric(
                            horizontal: 0.0, vertical: 0.0),
                        height: 300,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 80,
                              child: Padding(
                                padding:
                                    EdgeInsets.fromLTRB(50, 10.0, 0.0, 0.0),
                                child: Text(
                                  "Event",
                                  style: TextStyle(
                                      fontSize: 30.0,
                                      color: Colors.grey[600],
                                      fontWeight: FontWeight.w400,
                                      fontFamily: "Caviar"),
                                ),
                              ),
                            ),
                            Container(height: 120, color: Colors.redAccent),
                            Container(height: 50, color: Colors.blueAccent),
                          ],
                        ),
                      ),
                    )),
                // Positioned(
                //   bottom: 80,
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.start,
                //     children: [
                //       Expanded(
                //         child: Padding(
                //           padding:
                //               const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
                //           child: button("Appointments"),
                //         ),
                //       ),
                //       Expanded(
                //         child: Padding(
                //             padding:
                //                 const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
                //             child: button("Add Event")),
                //       )
                //     ],
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
