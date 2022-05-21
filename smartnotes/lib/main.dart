import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:smartnotes/screens/Authentication/sign_in.dart';
import 'package:smartnotes/screens/Authentication/sign_up.dart';
import 'package:smartnotes/screens/Explore/explore.dart';
import 'package:smartnotes/screens/Forums/forum.dart';
import 'package:smartnotes/screens/Home/home.dart';
import 'package:smartnotes/screens/PersonalNotes/personal_notes.dart';
import 'package:smartnotes/screens/Profile/profile.dart';
import 'package:smartnotes/screens/SplashScreen/splash_screen.dart';
import 'package:smartnotes/services/user_status.dart';
import 'package:smartnotes/views/mobile_view/mobile_view.dart';

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
    return DismissKeyboard(
        child: ChangeNotifierProvider(
      create: (context) => UserStatus(),
      child: MaterialApp(
        // showPerformanceOverlay: true,
        title: 'Smart Notes',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(primary: const Color(0xff0081C6)),
          ),
        ),
        routes: {
          '/': (context) => const SplashScreen(),
          '/home': (context) => const Home(),
          '/mobileView': (context) => const MobileView(),
          '/explore': (context) => const Explore(),
          '/forum': (context) => const Forum(),
          '/signUp': (context) => const SignUp(),
          '/signIn': (context) => const SignIn(),
          '/profile': (context) => const Profile(),
          '/notesView': (context) => const PersonalNotes(),
        },
      ),
    ));
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
