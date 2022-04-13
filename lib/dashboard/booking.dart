import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class Booking extends StatefulWidget {
  @override
  _BookingState createState() => _BookingState();
}

class _BookingState extends State<Booking> {
  int object = 1;
  DateTime _selectedDate;
  CalendarController _calendarController;
  MaterialButton button(String value) => MaterialButton(
      onPressed: null,
      shape: roundedBorder(),
      disabledElevation: 1.5,
      child: Text(
        value,
        style: textStyle(),
      ),
      disabledColor: Colors.greenAccent);

  _handleDate(date) {
    setState(() {
      _selectedDate = date;
      //print(_selectedDate);
    });
  }

  RoundedRectangleBorder roundedBorder() => RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(15.0)));

  TextStyle textStyle() => TextStyle(
      fontSize: 14.1,
      fontWeight: FontWeight.w700,
      fontFamily: 'Caviar',
      color: Colors.black54);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: SfCalendar(
              view: CalendarView.week,
              onTap: (CalendarTapDetails calendarTapDetails) {
                DateTime date = calendarTapDetails.date;
                //   print(date);
              },
              controller: _calendarController,
              onSelectionChanged: _handleDate(DateTime.now()),
              //  onViewChanged: _calendarController.displayDate,
              initialDisplayDate: DateTime.now(),
              initialSelectedDate: DateTime.now(),
              dataSource: MeetingDataSource(getAppointment()),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
                  child: button("Appointments"),
                ),
              ),
              Expanded(
                child: Padding(
                    padding: const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
                    child: button("Add Event")),
              )
            ],
          )
        ],
      ),
    );
  }
}

List<Appointment> getAppointment() {
  List<Appointment> meetings = <Appointment>[];
  final DateTime today = DateTime.now();
  final DateTime startTime =
      DateTime(today.year, today.month, today.day, 15, 0, 0);
  final DateTime endTime = startTime.add(const Duration(hours: 2));

  meetings.add(Appointment(
    startTime: startTime,
    endTime: endTime,
    subject: 'Conference',
    color: Colors.orangeAccent,
  ));

  return meetings;
}

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Appointment> source) {
    appointments = source;
  }
}
