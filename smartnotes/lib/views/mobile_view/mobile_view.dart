import 'package:flutter/material.dart';

import 'package:smartnotes/screens/dashboard.dart';
import 'package:smartnotes/screens/explore.dart';
import 'package:smartnotes/screens/classrooms.dart';
import 'package:smartnotes/screens/personal_notes.dart';
import 'package:smartnotes/screens/sign_in.dart';

class MobileView extends StatefulWidget {
  const MobileView({ Key? key }) : super(key: key);

  @override
  State<MobileView> createState() => _MobileViewState();
}

class _MobileViewState extends State<MobileView> {
  int currentSelectedPage=1;

  List<Widget> pages = const <Widget>[
    Dashboard(),
    Explore(),
    Classrooms(),
    PersonalNotes(),
    SignIn()
  ];

  void onTap(int index) {
    setState(() {
      currentSelectedPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
      body: pages[currentSelectedPage],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTap,
        currentIndex: currentSelectedPage,

        selectedItemColor: Colors.black54,
        // showSelectedLabels: false,
        // selectedFontSize: 0,

        unselectedItemColor: Colors.grey.withOpacity(0.5),
        // showUnselectedLabels: false,
        // unselectedFontSize: 0,

        elevation: 0,
        
        type: BottomNavigationBarType.fixed,

        items: const [
          BottomNavigationBarItem(label:'Dashboard', icon: Icon(Icons.space_dashboard_rounded)),
          BottomNavigationBarItem(label:'Explore', icon: Icon(Icons.explore_rounded)),
          BottomNavigationBarItem(label:'Classrooms', icon: Icon(Icons.cast_for_education_rounded)),
          BottomNavigationBarItem(label:'Notes', icon: Icon(Icons.notes_rounded)),
          BottomNavigationBarItem(label:'Profile', icon: Icon(Icons.person)),
        ],
      ),
    ),
    );
  }
}