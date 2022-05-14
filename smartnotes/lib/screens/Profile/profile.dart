import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:smartnotes/constants.dart';
import 'package:smartnotes/models/user_model.dart';
import 'package:smartnotes/screens/AboutUs/about_us.dart';
import 'package:smartnotes/screens/Authentication/sign_in.dart';
import 'package:smartnotes/screens/Profile/profile_button.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  UserModel loggedInUser = UserModel();

  @override
  void initState() {
    super.initState();
    fetchUserData();
  }

  void fetchUserData() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (FirebaseAuth.instance.currentUser == null) {
      // Fluttertoast.showToast(msg: "No User");
      loggedInUser = UserModel();
      setState(() {});
    } else {
      FirebaseFirestore.instance
          .collection("users")
          .doc(user!.uid)
          .get()
          .then((value) {
        setState(() {
          loggedInUser = UserModel.fromMap(value.data());
        });
        Fluttertoast.showToast(
            msg: "User Found " + loggedInUser.name.toString());
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    final signOutButton = ProfileButton(
        buttonName: "Sign Out",
        buttonIcon: Icons.exit_to_app,
        action: () {
          Fluttertoast.showToast(msg: "Signout Clicked");
          signOut(context);
        },
        link: "");

    final greeting = Row(
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
    );

    final signInGreeting = InkWell(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const SignIn()))
            .then((value) => {
                  Fluttertoast.showToast(msg: "Inititating User Search"),
                  fetchUserData()
                });
      },
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
            "Click to Sign In",
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: secondary,
            ),
          ),
        ],
      ),
    );

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
                child: loggedInUser.name == null ? signInGreeting : greeting),
            if (loggedInUser.email != null)
              ProfileButton(
                  buttonName: "Account",
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
                  Fluttertoast.showToast(msg: "Preference Clicked");
                },
                link: ""),
            if (loggedInUser.email != null)
              ProfileButton(
                  buttonName: "Personal Notes",
                  buttonIcon: Icons.notes_rounded,
                  action: () {
                    Navigator.pushNamed(context, '/notesView');
                  },
                  link: ""),
            if (loggedInUser.email != null)
              ProfileButton(
                  buttonName: "Upload",
                  buttonIcon: Icons.add_circle_outline_outlined,
                  action: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const Upload()));
                  },
                  link: ""),
            ProfileButton(
                buttonName: "About",
                buttonIcon: Icons.engineering_rounded,
                action: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const AboutUs()));
                },
                link: ""),
            if (loggedInUser.email != null) signOutButton,
            const Text("App Version: 1.0.0",
                style: TextStyle(fontSize: 10.0, color: Colors.grey))
          ],
        ),
      ),
    );
  }

  Future<void> signOut(BuildContext context) async {
    await FirebaseAuth.instance.signOut().then((value) => fetchUserData());
  }
}
