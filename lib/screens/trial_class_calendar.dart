import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';

class TrialClassCalendar extends StatelessWidget {
  final String? jobStartDate;
  final String? jobEndDate;
  const TrialClassCalendar({
    super.key,
    required this.jobStartDate,
    required this.jobEndDate,
  });

  bool isMonthInRange(
      DateTime startDate, DateTime endDate, int month, int year) {
    if (startDate.isAfter(endDate)) {
      throw ArgumentError('startDate should be before endDate');
    }

    if (year < startDate.year || year > endDate.year) return false;

    if (year == startDate.year && year == endDate.year) {
      return month >= startDate.month && month <= endDate.month;
    } else if (year == startDate.year) {
      return month >= startDate.month;
    } else if (year == endDate.year) {
      return month <= endDate.month;
    }

    return true;
  }

  @override
  Widget build(BuildContext context) {
    final firstDate = DateTime(
      int.tryParse(jobStartDate!.substring(0, 4)) ?? DateTime.now().year,
      int.tryParse(jobStartDate!.substring(5, 7)) ?? DateTime.now().month,
      int.tryParse(jobStartDate!.substring(8, 10)) ?? DateTime.now().day,
    );
    final lastDate = DateTime(
      int.tryParse(jobEndDate!.substring(0, 4)) ?? DateTime.now().year,
      int.tryParse(jobEndDate!.substring(5, 7)) ?? DateTime.now().month,
      int.tryParse(jobEndDate!.substring(8, 10)) ?? DateTime.now().day,
    );

    return CalendarDatePicker2(
      config: CalendarDatePicker2Config(
        selectableMonthPredicate: (year, month) =>
            isMonthInRange(firstDate, lastDate, month, year),
        selectedDayHighlightColor: Colors.blue,
        weekdayLabels: ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'],
        weekdayLabelTextStyle: const TextStyle(
          color: Colors.black87,
          fontWeight: FontWeight.bold,
        ),
        controlsTextStyle: const TextStyle(
          color: Colors.black,
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
        dayTextStyle: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
        disabledDayTextStyle: const TextStyle(
          color: Colors.grey,
        ),
        disabledMonthTextStyle: const TextStyle(
          color: Colors.grey,
        ),
        firstDate: firstDate,
        lastDate: lastDate,
      ),
      value: const [],
    );
  }
}
