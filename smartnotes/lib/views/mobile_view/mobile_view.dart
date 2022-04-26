import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:smartnotes/models/user_model.dart';

import 'package:smartnotes/screens/dashboard.dart';
import 'package:smartnotes/screens/explore.dart';
import 'package:smartnotes/screens/classrooms.dart';
import 'package:smartnotes/screens/personal_notes.dart';
import 'package:smartnotes/screens/profile.dart';
import 'package:smartnotes/screens/sign_in.dart';

class MobileView extends StatefulWidget {
  const MobileView({Key? key}) : super(key: key);

  @override
  State<MobileView> createState() => _MobileViewState();
}

class _MobileViewState extends State<MobileView> {
  int currentSelectedPage = 0;
  UserModel loggedInUser = UserModel();

  final List<Widget> pages = [
    const Dashboard(),
    const Explore(),
    const Classrooms(),
    const PersonalNotes(),
    const SignIn()
  ];

  void onTap(int index) {
    setState(() {
      currentSelectedPage = index;
    });
  }

  @override
  void initState() {
    super.initState();
    // Fluttertoast.showToast(msg: "Main View Initilized");
    User? user = FirebaseAuth.instance.currentUser;
    if (FirebaseAuth.instance.currentUser == null) {
      Fluttertoast.showToast(msg: "No User");
      return;
    }
    FirebaseFirestore.instance
        .collection("users")
        .doc(user?.uid)
        .get()
        .then((value) {
      loggedInUser = UserModel.fromMap(value.data());
      Fluttertoast.showToast(msg: "Welcome " + loggedInUser.name.toString());

      // pages.
      setState(() {
        pages[4] = const Profile();
      });
    }).catchError((error) {
      Fluttertoast.showToast(msg: error);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: pages[currentSelectedPage],
        bottomNavigationBar: BottomNavigationBar(
          onTap: (onTap),
          currentIndex: currentSelectedPage,

          selectedItemColor: Colors.amber,
          // showSelectedLabels: false,
          // selectedFontSize: 0,

          unselectedItemColor: Colors.black.withOpacity(0.32),
          // showUnselectedLabels: false,
          // unselectedFontSize: 0,

          elevation: 0,

          type: BottomNavigationBarType.fixed,

          items: const [
            BottomNavigationBarItem(
                label: 'Dashboard', icon: Icon(Icons.space_dashboard_rounded)),
            BottomNavigationBarItem(
                label: 'Explore', icon: Icon(Icons.explore_rounded)),
            BottomNavigationBarItem(
                label: 'Classrooms',
                icon: Icon(Icons.cast_for_education_rounded)),
            BottomNavigationBarItem(
                label: 'Notes', icon: Icon(Icons.notes_rounded)),
            BottomNavigationBarItem(label: 'Profile', icon: Icon(Icons.person)),
          ],
        ),
      ),
    );
  }
}