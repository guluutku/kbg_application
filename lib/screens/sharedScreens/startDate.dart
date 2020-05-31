import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class StartDate extends StatelessWidget {
  
  final dateForm = DateFormat("dd - mm - yyyy");

  DateTime startDate = new DateTime.now();

  CalendarController _calendarController = new CalendarController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            TableCalendar(
              onDaySelected: (date, events){
                startDate = date;
                print(startDate.toIso8601String());
              },
              startingDayOfWeek: StartingDayOfWeek.monday,
              initialCalendarFormat: CalendarFormat.month,
              calendarStyle: CalendarStyle(
                todayColor: Colors.deepOrange,
              ),
              calendarController: _calendarController,
              headerStyle: HeaderStyle(
                centerHeaderTitle: true,
                formatButtonShowsNext: false,
              ),

            )
          ],
        ),
      ),
    );
  }
}
