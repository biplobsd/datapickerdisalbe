import 'package:datapickerdisalbe/screens/trial_class_calendar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Selectable Month, Picker 2"),
      ),
      body: const TrialClassCalendar(
        jobStartDate: '2024/04/01',
        jobEndDate: '2024/05/02',
      ),
    );
  }
}
