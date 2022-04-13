import 'dart:convert';

import 'calendarModel.dart';
import 'package:http/http.dart' as http;

class CalendarData {
  Future<CalendarModel> getCalendarData() async {
    Map<String, String> headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };

    Uri uri = Uri.parse("https://kq879.mocklab.io/event");

    var response = await http.get(uri, headers: headers);
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      // print(jsonData);

      return CalendarModel.fromJson(jsonDecode(response.body));
    } else {
      print("error");
    }
  }

  Future<List<DateTime>> getUser() {
    var dateTimeList = new List();

    getCalendarData().then((value) {
      if (value.name.isNotEmpty) {
        print("This is from flutter.");
        print(value.name);

        print(value.scheduleDetails.length);
        for (int i = 0; i < value.scheduleDetails.length; i++) {
          dateTimeList.add(value.scheduleDetails[i].date);
          print(value.scheduleDetails[i].date);
          print(value.scheduleDetails[i].startTime);
          print(value.scheduleDetails[i].endTime);
          dateTimeList.add(value.scheduleDetails[i].date);
        }
        return dateTimeList;
      }
    });
  }
}
