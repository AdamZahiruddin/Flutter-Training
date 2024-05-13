import 'package:flutter/material.dart';

class DateTimePage extends StatefulWidget {
  const DateTimePage({Key? key}) : super(key: key);

  @override
  State<DateTimePage> createState() => _DateTimePageState();
}

class _DateTimePageState extends State<DateTimePage> {
  late DateTime? EndDate;
  String date1 = "Date1";
  String date2 = "Date2";
  String time1 = "Time1";
  String time2 = "Time2";

  Future<DateTime?> getDateInput() async {
    final date = await showDatePicker(
      context: context,
      firstDate: DateTime(2010),
      lastDate: DateTime(2030),
      initialDate: DateTime.now(),
    );

    return date;
  }

  Future<TimeOfDay?> getTimeInput() async {
    final time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    return time;
  }

  String dateFormat(DateTime date) {
    String month = date.month.toString().padLeft(2, '0');
    String day = date.day.toString().padLeft(2, '0');
    return "${date.year}-$month-$day";
  }

  String timeFormat(TimeOfDay time) {
    String hour = time.hour.toString().padLeft(2, '0');
    String minutes = time.minute.toString().padLeft(2, '0');

    return "$hour:$minutes";
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
              "Date and Time Range",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            width: double.infinity,
            height: 50,
          ),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () async {
                    final date = await getDateInput();
                    if (date != null) {
                      setState(() {
                        date1 = dateFormat(date);
                      });
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                  child: Container(
                    height: 50,
                    alignment: Alignment.center,
                    child: Text(
                      date1,
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: ElevatedButton(
                  onPressed: () async {
                    final date = await getDateInput();
                    EndDate  = date;
                    if (date != null) {
                      if (date.isBefore(DateTime.parse(date1))) {
                        setState(() {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Date 2 cannot be before Date 1'),
                              backgroundColor: Colors.red,
                            ),
                          );
                        });
                      } else {
                        setState(() {
                          date2 = dateFormat(date);
                        });
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
                    height: 50,
                    alignment: Alignment.center,
                    child: Text(
                      date2,
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () async {
                    final time = await getTimeInput();
                    if (time != null) {
                      setState(() {
                        time1 = timeFormat(time);
                      });
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                  child: Container(
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
                    //make validation
                  
                    
                    DateTime t1 = DateTime.parse("2022-01-01 ${time1}");
                   // String Masa1 = t1.toString();
                    DateTime t2 = DateTime.parse("2022-01-01 ${timeFormat(time!)}");
                    if (t2.isBefore(t1)) {
                       setState(() {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Time 2 cannot be before Time 1'),
                              backgroundColor: Colors.red,
                            ),
                          );
                        });
                  } else {
                    setState(() {
                    time2 = timeFormat(time!);
                    });
                  }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                  child: Container(
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



  /*Widget build1(BuildContext context){
  return Scaffold(
    body : Row(
      children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () async {
                    final time = await getTimeInput();
                    if (time != null) {
                      setState(() {
                       time1 = timeFormat(time);
                      });
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 105, 168, 107),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                  child: Container(
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
                    final time = await getDateInput();
                    if (time!.isBefore(time1 as DateTime)) {
                      setState(() {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Time 1 cannot be after Time 2'),
                          backgroundColor: Colors.red));
                      });
                    }
                    else {
                      setState(() {
                        time2 = timeFormat(time as TimeOfDay);
                      });
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                  child: Container(
                    height: 10,
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      time2,
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ),
              ),
            ],
          )
  );
} */ 
