import 'package:flutter/material.dart';
import 'package:smartnotes/constants.dart';

import 'package:smartnotes/screens/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart Notes',
      debugShowCheckedModeBanner: false,
      home: const MainScreen(),
      // home: const MainScreen(),
      theme: ThemeData(
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(primary: const Color(0xff0081C6)),
        ),
      ),
    );
  }
}
