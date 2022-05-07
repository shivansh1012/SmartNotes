import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:smartnotes/models/user_model.dart';

import 'package:smartnotes/screens/Home/home.dart';
import 'package:smartnotes/screens/Explore/explore.dart';
import 'package:smartnotes/screens/Forums/forum.dart';
import 'package:smartnotes/screens/Profile/profile.dart';
import 'package:smartnotes/views/mobile_view/bottom_navigation.dart';
import 'package:smartnotes/views/mobile_view/tab_item.dart';

class MobileView extends StatefulWidget {
  const MobileView({Key? key}) : super(key: key);

  @override
  State<MobileView> createState() => MobileViewState();
}

class MobileViewState extends State<MobileView> {
  static int currentSelectedPage = 0;
  UserModel loggedInUser = UserModel();

  final List<TabItem> tabs = [
    TabItem(
        tabName: "Home",
        icon: Icons.space_dashboard_rounded,
        page: const Home()),
    TabItem(
        tabName: "Explore",
        icon: Icons.explore_outlined,
        page: const Explore()),
    TabItem(
        tabName: "Forum",
        icon: Icons.cast_for_education_rounded,
        page: const Forum()),
    TabItem(
        tabName: "Profile", icon: Icons.person_outline, page: const Profile())
  ];

  void onTap(int index) {
    if (index == currentSelectedPage) {
      tabs[index].key.currentState?.popUntil((route) => route.isFirst);
    } else {
      setState(() {
        currentSelectedPage = index;
      });
    }
  }

  MobileViewState() {
    tabs.asMap().forEach((index, details) {
      details.setIndex(index);
    });
  }

  @override
  void initState() {
    super.initState();
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
    }).catchError((error) {
      Fluttertoast.showToast(msg: error);
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final isFirstRouteInCurrentTab =
            !await tabs[currentSelectedPage].key.currentState!.maybePop();
        // if (isFirstRouteInCurrentTab) {
        //   if (currentSelectedPage != 0) {
        //     onTap(0);
        //     return false;
        //   }
        // }
        return isFirstRouteInCurrentTab;
      },
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
        // indexed stack shows only one child
        body: IndexedStack(
          index: currentSelectedPage,
          children: tabs.map((e) => e.page).toList(),
        ),
        // Bottom navigation
        bottomNavigationBar: BottomNavigation(
          onSelectTab: onTap,
          tabs: tabs,
        ),
      ),
    );
  }
}
