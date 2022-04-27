import 'package:flutter/material.dart';
import 'package:smartnotes/screens/Forums/forum.dart';
import 'package:smartnotes/screens/Home/home.dart';
import 'package:smartnotes/screens/Explore/explore.dart';
// import 'package:smartnotes/screens/PersonalNotes/personal_notes.dart';
import 'package:smartnotes/screens/Profile/profile.dart';
import 'package:smartnotes/screens/Upload/upload.dart';

class TabNavigator extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey;
  final String tabItem;
  const TabNavigator(
      {Key? key, required this.navigatorKey, required this.tabItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget child = const Home();

    if (tabItem == "dashboard") {
      child = const Home();
    } else if (tabItem == "explore") {
      child = const Explore();
    } else if (tabItem == "upload") {
      child = const Upload();
    } else if (tabItem == "forum") {
      child = const Forum();
    }
    // else if (tabItem == "personalnotes") {
    //   child = const PersonalNotes();
    // }
    else if (tabItem == "profile") {
      child = const Profile();
    }

    return Navigator(
      key: navigatorKey,
      onGenerateRoute: (routeSettings) {
        return MaterialPageRoute(builder: (context) => child);
      },
    );
  }
}
