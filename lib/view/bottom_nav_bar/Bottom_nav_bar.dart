import 'package:flutter/material.dart';
import 'package:pinterest_clone_app/utils/constants/color_constant.dart';
import 'package:pinterest_clone_app/view/Home_screen/home_screen.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int selectedTab = 0;
  List screens = [
    HomeScreen(),
    Container(
      color: Colors.black,
    ),
    Container(
      color: Colors.black,
    ),
    Container(
      color: Colors.black,
    ),
    Container(
      color: Colors.black,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[selectedTab],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedTab,
        backgroundColor: ColorConstant.black,
        onTap: (value) {
          setState(() {});
        },
        selectedItemColor: ColorConstant.white,
        unselectedItemColor: ColorConstant.lightGrey,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.comment), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ""),
        ],
      ),
    );
  }
}
