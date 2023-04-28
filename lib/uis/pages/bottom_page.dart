import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task/uis/bottomPages/directory_page.dart';
import 'package:task/uis/bottomPages/my_team.dart';
import 'package:task/uis/bottomPages/profile_page.dart';
import 'package:task/uis/bottomPages/search_businesses.dart';
import 'package:task/uis/pages/bottom_nav.dart';
import 'package:task/uis/pages/dashboard_view_model.dart';

class DashBoardScreen extends StatefulWidget {
  static const String route = 'DashBoardScreen';
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  @override
  Widget build(BuildContext context) {
    final indexBottomNav = context.select<DashBoardViewModel, int>(
      (value) => value.bottomNavIndex,
    );
    return Scaffold(
      body: _getScreen(indexBottomNav),
      bottomSheet: BottomNavBar(
        selectedIndex: indexBottomNav,
        onItemSelected: (int newIndex) {
          context.read<DashBoardViewModel>().bottomNavIndex = newIndex;
        },
      ),
    );
  }

  Widget _getScreen(int index) => [
        ProfilePage.new,
        MyTeamPage.new,
        SearchBusinessPage.new,
        DirectoryPage.new,
      ][index]
          .call();
}
