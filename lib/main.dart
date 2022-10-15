import 'package:flutter/material.dart';
import 'package:habit_tracker_hive/pages/home_page.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  // initialize hive
  await Hive.initFlutter();

  // open a box
  await Hive.openBox('Habit_Database');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.grey,
      ),
      home: const HomePage(),
    );
  }
}
