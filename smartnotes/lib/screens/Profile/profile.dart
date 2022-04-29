import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:smartnotes/constants.dart';
import 'package:smartnotes/models/user_model.dart';
import 'package:smartnotes/screens/Profile/profile_button.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(15.0),
              height: safeHeight * 0.15,
              width: safeWidth,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                border: Border.all(
                  color: secondary,
                ),
              ),
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 25.0,
                    backgroundColor: Colors.amber,
                  ),
                  const SizedBox(
                    width: 15.0,
                  ),
                  Text(
                    "Welcome, ${loggedInUser.name}",
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: secondary,
                    ),
                  ),
                ],
              ),
            ),
            ProfileButton(
                buttonName: "Profile",
                buttonIcon: Icons.person_rounded,
                action: () {
                  Fluttertoast.showToast(msg: "Profile Clicked");
                },
                link: ""),
            ProfileButton(
                buttonName: "Settings",
                buttonIcon: Icons.settings,
                action: () {
                  Fluttertoast.showToast(msg: "Settings Clicked");
                },
                link: ""),
            ProfileButton(
                buttonName: "Preference",
                buttonIcon: Icons.precision_manufacturing,
                action: () {
                  Fluttertoast.showToast(msg: "Preferecnde Clicked");
                },
                link: ""),
            ProfileButton(
                buttonName: "Personal Notes",
                buttonIcon: Icons.notes_rounded,
                action: () {
                  Fluttertoast.showToast(msg: "Personal Notes Clicked");
                },
                link: ""),
            ProfileButton(
                buttonName: "About",
                buttonIcon: Icons.engineering_rounded,
                action: () {
                  Fluttertoast.showToast(msg: "About Clicked");
                },
                link: ""),
            ProfileButton(
                buttonName: "Sign Out",
                buttonIcon: Icons.exit_to_app,
                action: () {
                  Fluttertoast.showToast(msg: "Signout Clicked");
                  signOut(context);
                },
                link: ""),
            const Text("App Version: 1.0.0",
                style: TextStyle(fontSize: 10.0, color: Colors.grey))
          ],
        ),
      ),
    );
  }

  Future<void> signOut(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.popAndPushNamed(context, '/mobileView');
    // Navigator.of(context).pushReplacement(
    //     MaterialPageRoute(builder: (context) => const Home()));
  }
}
