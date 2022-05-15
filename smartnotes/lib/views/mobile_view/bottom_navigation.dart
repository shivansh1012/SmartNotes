import 'package:flutter/material.dart';
import 'package:smartnotes/constants.dart';
import 'package:smartnotes/views/mobile_view/mobile_view.dart';
import 'package:smartnotes/views/mobile_view/tab_item.dart';

class BottomNavigation extends StatelessWidget {
  final ValueChanged<int> onSelectTab;
  final List<TabItem> tabs;
  const BottomNavigation({
    Key? key,
    required this.onSelectTab,
    required this.tabs,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: (index) => onSelectTab(
        index,
      ),

      currentIndex: MobileViewState.currentSelectedPage,

      selectedItemColor: primaryLight,
      showSelectedLabels: false,
      // selectedFontSize: 0,

      unselectedItemColor: Colors.black.withOpacity(0.32),
      showUnselectedLabels: false,
      // unselectedFontSize: 0,

      elevation: 0,

      type: BottomNavigationBarType.fixed,
      items: tabs
          .map(
            (e) => _buildItem(
              index: e.getIndex(),
              icon: e.icon,
              tabName: e.tabName,
            ),
          )
          .toList(),
    );
  }

  BottomNavigationBarItem _buildItem(
      {required int index, required IconData icon, required String tabName}) {
    return BottomNavigationBarItem(
        icon: Icon(
          icon,
        ),
        label: tabName);
  }
}
