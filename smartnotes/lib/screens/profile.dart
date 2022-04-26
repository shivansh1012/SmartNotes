import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:smartnotes/constants.dart';
import 'package:smartnotes/models/user_model.dart';
import 'package:smartnotes/screens/dashboard.dart';

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
    // TODO: implement initState
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      loggedInUser = UserModel.fromMap(value.data());
      Fluttertoast.showToast(msg: "Profile for" + loggedInUser.name.toString());
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final signOutButton = OutlinedButton(
      child: const Text(
        "Sign Out",
        style: TextStyle(
          fontSize: 16.0,
          color: Colors.white,
        ),
      ),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(primary),
      ),
      onPressed: () {
        signOut(context);
      },
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
                    "${loggedInUser.name}",
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: secondary,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 35.0,
                vertical: 15.0,
              ),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 20.0,
                    backgroundColor: Colors.blueAccent,
                  ),
                  const SizedBox(
                    width: 15.0,
                  ),
                  Text(
                    "General",
                    style: TextStyle(
                      fontSize: 18,
                      color: secondary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 35.0,
                vertical: 15.0,
              ),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 20.0,
                    backgroundColor: Colors.green,
                  ),
                  const SizedBox(
                    width: 15.0,
                  ),
                  Text(
                    "Preferences",
                    style: TextStyle(
                      fontSize: 18,
                      color: secondary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            signOutButton
          ],
        ),
      ),
    );
  }

  Future<void> signOut(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const Dashboard()));
  }
}
