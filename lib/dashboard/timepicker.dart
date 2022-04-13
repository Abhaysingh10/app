import 'package:flutter/material.dart';

// Timepicker({
//   BuildContext context,
//   TimeOfDay initialTime,
//   TransitionBuilder builder,
//   bool useRootNavigator: true,
//   TimePickerEntryMode initialEntryMode: TimePickerEntryMode.dial,
//   String cancelText,
//   String confirmText,
//   String helpText,
//   RouteSettings routeSettings
// })

class Timepicker extends StatefulWidget {
  Timepicker({Key key}) : super(key: key);

  @override
  State<Timepicker> createState() => _TimepickerState();
}

class _TimepickerState extends State<Timepicker> {
  void _selectTime(BuildContext context) async {
    TimeOfDay selectedTime = new TimeOfDay.now();

    final TimeOfDay newTime =
        await showTimePicker(context: context, initialTime: selectedTime);
    if (newTime != null) {
      setState(() {
        selectedTime = newTime;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
