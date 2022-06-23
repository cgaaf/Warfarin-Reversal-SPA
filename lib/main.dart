import 'package:flutter/material.dart';
import 'package:my_app/path-widget.dart';
import 'home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Warfarin Reversal Guide',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const PathWidget(),
    );
  }
}
