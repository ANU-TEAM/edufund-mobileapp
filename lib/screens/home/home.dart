import 'package:flutter/material.dart';
import 'package:mobileapp/screens/applications/application.dart';
import 'package:mobileapp/screens/info/info.dart';
import 'package:mobileapp/screens/new_application/new_application.dart';
import 'package:mobileapp/screens/profile/profile_screen.dart';
import 'package:mobileapp/utils/contants.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  late List<Widget> _children;

  @override
  void initState() {
    super.initState();
    _children = [
      ApplicationScreen(),
      NewApplicationScreen(),
      ProfileScreen(),
      InfoScreen()
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: IndexedStack(index: _currentIndex, children: _children),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: kPrimaryColor,
        unselectedItemColor: inActiveIconColor,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_rounded,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add_box,
            ),
            label: 'Apply',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
            ),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.info_sharp,
            ),
            label: 'Info',
          ),
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
