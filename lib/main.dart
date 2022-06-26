import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
        primaryColor: Colors.purple,
        accentColor: Colors.deepPurpleAccent,
        fontFamily: GoogleFonts.lato().fontFamily,
      ),
      home: const PathWidget(),
    );
  }
}
