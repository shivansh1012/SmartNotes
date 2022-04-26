import 'package:flutter/material.dart';
import 'package:smartnotes/screens/classrooms.dart';
import 'package:smartnotes/screens/dashboard.dart';
import 'package:smartnotes/screens/explore.dart';
import 'package:smartnotes/screens/personal_notes.dart';
import 'package:smartnotes/screens/profile.dart';

class TabNavigator extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey;
  final String tabItem;
  const TabNavigator({ Key? key, required this.navigatorKey, required this.tabItem }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget child = const Dashboard();

    if(tabItem == "dashboard") {
      child = const Dashboard();
    } else if(tabItem == "explore") {
      child = const Explore();
    } else if(tabItem == "classroom") {
      child = const Classrooms();
    } else if(tabItem == "personalnotes") {
      child = const PersonalNotes();
    } else if(tabItem == "profile") {
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