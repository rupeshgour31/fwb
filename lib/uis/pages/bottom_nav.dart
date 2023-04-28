import 'package:flutter/material.dart';
import 'package:task/utils/app_colors.dart';
import 'package:task/utils/constant.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar(
      {Key? key, required this.selectedIndex, required this.onItemSelected})
      : super(key: key);

  final int selectedIndex;
  final ValueChanged<int> onItemSelected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: BottomNavigationBar(
          onTap: onItemSelected,
          currentIndex: selectedIndex,
          type: BottomNavigationBarType.fixed,
          selectedFontSize: 11,
          unselectedFontSize: 11,
          selectedIconTheme: const IconThemeData(
            color: kAppColor,
          ),
          selectedItemColor: AppColors.appTheme1,
          items: [
            _buildItem(
              const Icon(Icons.person, size: 25),
              0,
            ),
            _buildItem(
              const Icon(Icons.groups, size: 25),
              1,
            ),
            _buildItem(
              const Icon(Icons.search, size: 25),
              2,
            ),
            _buildItem(
              const Icon(Icons.perm_contact_calendar_rounded, size: 25),
              3,
            )
          ],
        ),
      ),
    );
  }

  BottomNavigationBarItem _buildItem(
    Widget iconFileName,
    int index,
  ) =>
      BottomNavigationBarItem(
        activeIcon: Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: iconFileName,
        ),
        icon: Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: iconFileName,
        ),
        label: '',
      );
}
