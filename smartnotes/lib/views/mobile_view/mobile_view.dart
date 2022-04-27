import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:smartnotes/constants.dart';
import 'package:smartnotes/models/user_model.dart';

import 'package:smartnotes/screens/Dashboard/dashboard.dart';
import 'package:smartnotes/screens/Explore/explore.dart';
import 'package:smartnotes/screens/Classroom/classroom.dart';
// import 'package:smartnotes/screens/PersonalNotes/personal_notes.dart';
import 'package:smartnotes/screens/Profile/profile.dart';
import 'package:smartnotes/screens/Authentication/sign_in.dart';
import 'package:smartnotes/screens/Upload/upload.dart';

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
    const Upload(),
    const Classroom(),
    // const PersonalNotes(),
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
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 1,
          title: const Text(
            'Smart Notes',
            style: TextStyle(
              fontSize: 30.0,
              color: Colors.black,
              fontFamily: 'LobsterTwo',
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                onPressed: () => {
                  Fluttertoast.showToast(msg: "Personal Notes clicked"),
                },
                icon: const Icon(
                  Icons.article_outlined,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
        // body: pages[currentSelectedPage],
        body: IndexedStack(
          index: currentSelectedPage,
          children: pages,
        ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: (onTap),
          currentIndex: currentSelectedPage,

          selectedItemColor: primaryLight,
          // showSelectedLabels: false,
          // selectedFontSize: 0,

          unselectedItemColor: Colors.black.withOpacity(0.32),
          // showUnselectedLabels: false,
          // unselectedFontSize: 0,

          elevation: 0,

          type: BottomNavigationBarType.fixed,

          items: const [
            BottomNavigationBarItem(
              label: 'Home',
              icon: Icon(
                Icons.space_dashboard_rounded,
              ),
            ),
            BottomNavigationBarItem(
              label: 'Explore',
              icon: Icon(
                Icons.explore_outlined,
              ),
            ),
            BottomNavigationBarItem(
              label: 'Upload',
              icon: Icon(
                Icons.add_circle_outline_outlined,
              ),
            ),
            BottomNavigationBarItem(
              label: 'Forums',
              icon: Icon(
                Icons.cast_for_education_rounded,
              ),
            ),
            // BottomNavigationBarItem(
            //     label: 'Notes', icon: Icon(Icons.notes_rounded,),),
            BottomNavigationBarItem(
              label: 'Profile',
              icon: Icon(
                Icons.account_circle_outlined,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
