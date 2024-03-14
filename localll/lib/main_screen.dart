import 'package:flutter/material.dart';
import 'package:localllllll/profile.dart';
import 'package:localllllll/setting_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int index = 0;
  final List _page = [
    const Profile(),
    const Profile(),
    const Profile(),
    const Profile(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _page[index],
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 30,
        currentIndex: index,
        selectedItemColor: Colors.purple.shade400,
        unselectedItemColor: Colors.black87,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: "home",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
            ),
            label: "search",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.store,
            ),
            label: "store",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
            ),
            label: "profile",
          )
        ],
        onTap: (value) {
          setState(() {
            index = value;
          });
        },
      ),
    );
  }
}
