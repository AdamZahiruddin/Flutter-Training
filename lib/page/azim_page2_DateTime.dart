import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:simple_widget_app/widget/alertBox.dart';

class DateTimePage extends StatefulWidget {
  const DateTimePage({super.key});

  @override
  State<DateTimePage> createState() => _DateTimePageState();
}

class _DateTimePageState extends State<DateTimePage> {
  String? StartDate;
  String? EndDate;
  String date1 = "Date1";
  String date2 = "Date2";

  //Time Variable
  TimeOfDay? StartTime;
  TimeOfDay? EndTime;
  String time1 = 'Time1';
  String time2 = 'Time2';

  Future<DateTime?> getInput() async {
    final time = await showDatePicker(
        context: context,
        firstDate: DateTime(2010),
        lastDate: DateTime(2030),
        initialDate: DateTime.now());

    return time;
  }

  String dateFormat(DateTime time) {
    String month =
        time.month.toString().padLeft(2, '0'); // Ensure two digits for month
    String day = time.day.toString().padLeft(2, '0');
    return "${time.year}-$month-$day";
  }

  Future<TimeOfDay?> getTimeInput() async {
    final time =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());
    return time;
  }

  String timeFormat(TimeOfDay time) {
    final hour =
        time.hour.toString().padLeft(2, '0'); // Ensure two digits for hour
    final minute =
        time.minute.toString().padLeft(2, '0'); // Ensure two digits for minute
    return "$hour:$minute";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.center,
            color: Colors.blue,
            child: Text(
              "Date Range",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            width: double.infinity, // Expand to fill the width
            height: 50,
          ),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () async {
                    final time = await getInput();
                    if (time != null) {
                      if (EndDate != null &&
                          time.isAfter(DateTime.parse(EndDate!))) {
                        displayAlert(context, 'Alert',
                            'start time cannot be later than end time');
                      } else {
                        setState(() {
                          date1 = dateFormat(time);
                          StartDate = date1;
                        });
                        displayAlert(context, "Success",
                            "Start Date: ${dateFormat(time)}");
                      }
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green, // Button background color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero, // No border radius
                    ),
                  ),
                  child: Container(
                    width: double.infinity, // Expand to fill the width
                    height: 50,
                    alignment: Alignment.center,
                    child: Text(
                      date1,
                      style: const TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: ElevatedButton(
                  onPressed: () async {
                    final time = await getInput();
                    if (time != null) {
                      if (StartDate != null &&
                          time.isBefore(DateTime.parse(StartDate!))) {
                        displayAlert(context, 'Alert',
                            'end time cannot be earlier than start time');
                      } else {
                        setState(() {
                          date2 = dateFormat(time);
                          EndDate = date2;
                        });
                        displayAlert(context, "Success",
                            "End Date: ${dateFormat(time)}");
                      }
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green, // Button background color
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero, // No border radius
                    ),
                  ),
                  child: Container(
                    width: double.infinity, // Expand to fill the width
                    height: 50,
                    alignment: Alignment.center,
                    child: Text(
                      date2,
                      style: const TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 25,
          ),

          //Time Picker
          Container(
            alignment: Alignment.center,
            color: Colors.blue,
            child: Text(
              "Time Range",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            width: double.infinity, // Expand to fill the width
            height: 50,
          ),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () async {
                    final time = await getTimeInput();
                    if (time != null) {
                      if (EndTime != null &&
                          (time.hour > EndTime!.hour ||
                              (time.hour == EndTime!.hour &&
                                  time.minute >= EndTime!.minute))) {
                        displayAlert(context, 'Alert',
                            'start time cannot be later than or equal to end time');
                      } else {
                        setState(() {
                          time1 = timeFormat(time);
                          StartTime = time;
                        });
                        displayAlert(context, "Success",
                            "Start Time: ${timeFormat(time)}");
                      }
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    alignment: Alignment.center,
                    child: Text(
                      time1,
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: ElevatedButton(
                  onPressed: () async {
                    final time = await getTimeInput();
                    if (time != null) {
                      if (StartTime != null &&
                          (time.hour < StartTime!.hour ||
                              (time.hour == StartTime!.hour &&
                                  time.minute <= StartTime!.minute))) {
                        displayAlert(context, 'Alert',
                            'end time cannot be earlier than or equal to start time');
                      } else {
                        setState(() {
                          time2 = timeFormat(time);
                          EndTime = time;
                        });
                        displayAlert(context, "Success",
                            "End Time: ${timeFormat(time)}");
                      }
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    alignment: Alignment.center,
                    child: Text(
                      time2,
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
