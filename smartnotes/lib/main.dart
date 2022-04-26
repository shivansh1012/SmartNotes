import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:smartnotes/views/mobile_view/mobile_view.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
      home: const MobileView(),
      // home: const MainScreen(),
      theme: ThemeData(
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(primary: const Color(0xff0081C6)),
        ),
      ),
    );
  }
}
