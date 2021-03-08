import 'package:flutter/material.dart';
import 'package:mobileapp/components/bottom_navigation.dart';
import '../../utils/enum.dart';
import 'component/body.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body: ProfileBody(),
      bottomNavigationBar: BottomNavigation(
        selectedMenu: MenuState.profile,
      ),
    );
  }
}
