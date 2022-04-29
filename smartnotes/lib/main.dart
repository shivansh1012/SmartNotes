import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smartnotes/screens/SplashScreen/splash_screen.dart';
// import 'package:smartnotes/views/mobile_view/mobile_view.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      // options: const FirebaseOptions(
      //     apiKey: "AIzaSyAJJolI6XzawYLR1heg3hzanWP-35NuIQ8",
      //     projectId: "smartnotes-46d96",
      //     messagingSenderId: "486764833620",
      //     appId: "1:486764833620:web:11a35126d22886295af6c1"),
      );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // To fix keyboard error
  @override
  void initState() {
    SystemChannels.textInput.invokeMethod('TextInput.hide');
    super.initState();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // showPerformanceOverlay: true,
      title: 'Smart Notes',
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      theme: ThemeData(
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(primary: const Color(0xff0081C6)),
        ),
      ),
    );
  }
}
