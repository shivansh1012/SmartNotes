import 'package:flutter/material.dart';
import 'package:smartnotes/screens/classrooms.dart';
import 'package:smartnotes/screens/personal_notes.dart';
import 'package:smartnotes/screens/profile.dart';
import 'package:smartnotes/screens/explore.dart';
import 'package:smartnotes/screens/dashboard.dart';

/* 

* This page is solely made for the purpose of the BottomNavBar.
* The bottomNavBar is the main screen of the app and all the other
* screens come on top of the NavBar.

* -- Other screens should not contain a bottomNavigationBar option
*  to avoid any conflicts.

*/

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int pageIndex = 0;
  List<Widget> pageList = const <Widget>[
    Dashboard(),
    Explore(),
    Classrooms(),
    PersonalNotes(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: pageList[pageIndex],
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.amber,
          unselectedItemColor: Colors.black.withOpacity(0.32),
          currentIndex: pageIndex,
          onTap: (value) {
            setState(() {
              pageIndex = value;
            });
          },
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.space_dashboard,
                size: 25,
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.explore_outlined,
                size: 25,
              ),
              label: "Explore",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.tv_rounded,
                size: 25,
              ),
              label: "Classroom",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.notes_outlined,
                size: 25,
              ),
              label: "My Notes",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.account_circle_outlined,
                size: 25,
              ),
              label: "Profile",
            ),
          ],
        ),
      ),
    );
  }
}
