import 'package:applicationform/widget/drawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/calanderi_controller.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class CalanderiView extends GetView<CalanderiController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 1, 31, 77),
      ),
      body: SafeArea(
        child: SfCalendar(
          view: CalendarView.day,
          allowedViews: [
            CalendarView.day,
            CalendarView.week,
            CalendarView.workWeek,
            CalendarView.month,
            CalendarView.day,
            CalendarView.week,
            CalendarView.timelineMonth,
            CalendarView.schedule
          ],
          dataSource: _getCalendarDataSource(),
          todayHighlightColor: Color.fromARGB(255, 1, 31, 77),
        ),
      ),
    );
  }

  _AppointmentDataSource _getCalendarDataSource() {
    List<Appointment> appointments = <Appointment>[];
    appointments.add(Appointment(
      startTime: DateTime.now(),
      endTime: DateTime.now().add(Duration(hours: 1)),
      subject: 'Meeting',
      color: Colors.orangeAccent.shade200,
    ));
    appointments.add(Appointment(
      startTime: DateTime.now().add(Duration(hours: 2)),
      endTime: DateTime.now().add(Duration(hours: 3)),
      subject: 'Planning',
      color: Colors.orangeAccent.shade200,
    ));
    appointments.add(Appointment(
      startTime: DateTime.now(),
      endTime: DateTime.now().add(Duration(hours: 1)),
      subject: 'Meeting',
      color: Colors.orangeAccent.shade200,
    ));

    return _AppointmentDataSource(appointments);
  }
}

class _AppointmentDataSource extends CalendarDataSource {
  _AppointmentDataSource(List<Appointment> source) {
    appointments = source;
  }
}
