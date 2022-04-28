import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
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

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return DismissKeyboard(
      child: MaterialApp(
        // showPerformanceOverlay: true,
        title: 'Smart Notes',
        debugShowCheckedModeBanner: false,
        home: const SplashScreen(),
        theme: ThemeData(
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(primary: const Color(0xff0081C6)),
          ),
        ),
      ),
    );
  }
}

//https://www.kindacode.com/article/flutter-dismiss-keyboard-when-tap-outside-text-field/
class DismissKeyboard extends StatelessWidget {
  final Widget child;
  const DismissKeyboard({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          FocusManager.instance.primaryFocus?.unfocus();
        }
      },
      child: child,
    );
  }
}

