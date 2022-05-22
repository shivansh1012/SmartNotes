import 'package:flutter/material.dart';
import 'package:smartnotes/screens/Forums/components/forum.dart';

import 'package:smartnotes/screens/Home/home.dart';
import 'package:smartnotes/screens/Explore/explore.dart';
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

  final List<TabItem> tabs = [
    TabItem(
        tabName: "Home",
        icon: Icons.space_dashboard_rounded,
        page: const Home()),
    TabItem(
        tabName: "Explore",
        icon: Icons.explore_outlined,
        page: const Explore()),
    TabItem(tabName: "Forum", icon: Icons.forum, page: const Forum()),
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
