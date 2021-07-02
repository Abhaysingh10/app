// class CalendarModel {
//   CalendarModel({
//     this.name,
//     this.scheduleDetails,
//   });

//   String name;
//   List<ScheduleDetail> scheduleDetails;

//   factory CalendarModel.fromJson(Map<String, dynamic> json) => CalendarModel(
//         name: json["Name"],
//         scheduleDetails: List<ScheduleDetail>.from(
//             json["ScheduleDetails"].map((x) => ScheduleDetail.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "Name": name,
//         "ScheduleDetails":
//             List<dynamic>.from(scheduleDetails.map((x) => x.toJson())),
//       };
// }

// class ScheduleDetail {

//   ScheduleDetail({
//     this.date,
//     this.startTime,
//     this.endTime,
//   });

//   DateTime date;
//   String startTime;
//   String endTime;

//   factory ScheduleDetail.fromJson(Map<String, dynamic> json) => ScheduleDetail(
//         date: DateTime.parse(json["Date"]),
//         startTime: json["StartTime"],
//         endTime: json["EndTime"],
//       );

//   Map<String, dynamic> toJson() => {
//         "Date":
//             "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
//         "StartTime": startTime,
//         "EndTime": endTime,
//       };
// }

class CalendarModel {
  CalendarModel({
    this.name,
    this.userId,
    this.scheduleDetails,
  });

  String name;
  String userId;
  List<ScheduleDetail> scheduleDetails;

  factory CalendarModel.fromJson(Map<String, dynamic> json) => CalendarModel(
        name: json["Name"],
        userId: json["user_id"],
        scheduleDetails: List<ScheduleDetail>.from(
            json["scheduleDetails"].map((x) => ScheduleDetail.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Name": name,
        "user_id": userId,
        "scheduleDetails":
            List<dynamic>.from(scheduleDetails.map((x) => x.toJson())),
      };
}

class ScheduleDetail {
  ScheduleDetail({
    this.date,
    this.startTime,
    this.endTime,
    this.description,
  });

  DateTime date;
  String startTime;
  String endTime;
  String description;

  factory ScheduleDetail.fromJson(Map<String, dynamic> json) => ScheduleDetail(
        date: DateTime.parse(json["Date"]),
        startTime: json["StartTime"],
        endTime: json["EndTime"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "Date":
            "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "StartTime": startTime,
        "EndTime": endTime,
        "description": description,
      };
}
