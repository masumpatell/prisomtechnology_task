import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:prisomtechnology/constant/app_color.dart';
import 'package:prisomtechnology/constant/app_dimens.dart';
import 'package:prisomtechnology/screens/add_screen/add_screen.dart';
import 'package:prisomtechnology/screens/home/home_screen.dart';
import 'package:prisomtechnology/screens/setting_screen/setting_screen.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {

  List<Widget> _screens = [
    HomeScreen(),
    AddScreen(),
    SettingScreen()
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: ConvexAppBar(
        backgroundColor: AppColor.green,
        color: AppColor.yellow,
        items: const [
          TabItem(icon: Icons.home, title: "Home"),
          TabItem(icon: Icons.add, title: "Add User"),
          TabItem(icon: Icons.settings, title: "Setting")
        ],
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
