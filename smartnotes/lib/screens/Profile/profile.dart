import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:smartnotes/constants.dart';
import 'package:smartnotes/models/user_model.dart';
import 'package:smartnotes/screens/AboutUs/about_us.dart';
import 'package:smartnotes/screens/Authentication/sign_in.dart';
import 'package:smartnotes/screens/Profile/profile_button.dart';
import 'package:smartnotes/screens/Upload/upload.dart';
import 'package:smartnotes/services/user_status.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Consumer<UserStatus>(
            builder: (context, value, child) {
              if (!value.isUserLoggedIn) {
                return Column(
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
                        child: InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const SignIn()));
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
                            ))),
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
                    ProfileButton(
                        buttonName: "About",
                        buttonIcon: Icons.engineering_rounded,
                        action: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const AboutUs()));
                        },
                        link: ""),
                        const Text("App Version: 1.0.0",
                  style: TextStyle(fontSize: 10.0, color: Colors.grey))
                  ],
                );
              } else {
                return Column(
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
                              "Welcome, ${value.loggedInUser!.name}",
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                color: secondary,
                              ),
                            ),
                          ],
                        )),
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
                    ProfileButton(
                        buttonName: "Personal Notes",
                        buttonIcon: Icons.notes_rounded,
                        action: () {
                          Fluttertoast.showToast(msg: "Personal Notes Clicked");
                        },
                        link: ""),
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
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const AboutUs()));
                        },
                        link: ""),
                    ProfileButton(
                        buttonName: "Sign Out",
                        buttonIcon: Icons.exit_to_app,
                        action: () {
                          _signOut(context);
                        },
                        link: ""),
                        const Text("App Version: 1.0.0",
                  style: TextStyle(fontSize: 10.0, color: Colors.grey))
                  ],
                );
              }
            },
          ),
        ),
      ),
    );
  }

  void _signOut(context) async {
    UserStatus provider = Provider.of<UserStatus>(context, listen: false);
    await FirebaseAuth.instance.signOut().then(
      (value) async {
        UserModel? userData = await UserStatus().fetchUserData();
        provider.updateUserStatus(userData);
      }
    );
  }
}
